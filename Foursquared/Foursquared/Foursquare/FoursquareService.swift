//
//  FoursquareService.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import CoreLocation

enum ServiceError: Error {
    case badURL
    case serverError(String? = nil)
}

/// Service class used to interact with the [Foursquare Places API](https://developer.foursquare.com/reference/place-search)
/// All types returned from calling these methods are using not Foursquare specific, but use the more generic 'app types'.
/// This is to allow any other downstream API to be used, and swapped out instead of Foursquare, as long as it conforms to the `PlacesServiceProtocol` then the app will continue to work
class FoursquarePlacesService: PlacesServiceProtocol {
    
    
    /// Get specific details about a specific place
    /// - Parameter placeId: Id used to represent the place. In this case it will be an `fsq_id` used to represent a place in the Fourasquare API
    /// - Returns: A Result containing either a `PlaceDetail` object in the case of a successful call, or a `ServiceError` in the case of some failure
    func getPlaceDetails(for placeId: String) async -> Result<PlaceDetail, ServiceError> {
        
        let params: [String: String] = [
            "fields": "rating,hours,description"
        ]
        
        do {
            guard let request = authorizedPlacesRequest(forPath: placeId,
                                                                  withParams: params) else { return .failure(.badURL) }
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(FoursquareDetailResponse.self, from: data)
            let placeDetail = PlaceDetail(open: response.hours?.open_now,
                                          rating: response.rating,
                                          description: response.description)
            return .success(placeDetail)
        } catch {
            return .failure(.serverError(error.localizedDescription))
        }
    }
    
    
    /// Get images for a specific place
    /// - Parameter placeId: Id used to represent the place. In this case it will be an `fsq_id` used to represent a place in the Fourasquare API
    /// - Returns: A `Result` containing either a collection of image URLs represented as `String`s in the case of a successful call, or a `ServiceError` in the case of some failure
    func getImages(for placeId: String) async -> Result<[String], ServiceError> {
        
        var imageUrls: [String] = []
        
        do {
            guard let request = authorizedPlacesRequest(forPath: "\(placeId)/photos") else { return .failure(.badURL) }
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode([FourSquarePhotoItem].self, from: data)
            
            imageUrls = response.map { photoItem in
                "\(photoItem.prefix)original\(photoItem.suffix)"
            }
        } catch {
            return .failure(.serverError(error.localizedDescription))
        }
        
        return .success(imageUrls)
        
    }
    
    /// Get list of places around a certain location (provided as `location`), within a certain radius (provided as `radius`)
    /// - Parameters:
    ///   - location: The location to fetch the nearby locations to
    ///   - radius: A radius around the location for which to fetch the locations for
    /// - Returns: A `Result` containing either a list of `Place`s in the case of a successful call, or a `ServiceError` in the case of some failure
    func getPlaces(near location: CLLocationCoordinate2D, within radius: Int) async -> Result<[Place], ServiceError> {
        
        var places: [Place] = []
        let params: [String: String] = [
            "ll": "\(location.latitude),\(location.longitude)",
            "radius": String(radius)
        ]
        
        do {
            guard let request = authorizedPlacesRequest(forPath: "search", withParams: params) else { return .failure(.badURL) }
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(FoursquareSearchResponse.self, from: data)
            
            // convert foursquare specific types to app types
            places = response.results.map { foursquarePlace in
                Place(apiId: foursquarePlace.fsq_id, name: foursquarePlace.name,
                      location: CLLocationCoordinate2D(latitude: foursquarePlace.geocodes.main.latitude,
                                                       longitude: foursquarePlace.geocodes.main.longitude),
                      address: foursquarePlace.location.formatted_address,
                      distance: foursquarePlace.distance,
                      categoryImages: foursquarePlace.categoryImages)
            }
        } catch {
            return .failure(.serverError(error.localizedDescription))
        }
        
        return .success(places)
    }
    
    
    /// Generate a URL request to call the [Foursquare Places
    /// API](https://developer.foursquare.com/reference/place-search)
    ///
    /// This method also sets the required Authorization header needed to the authenticate successfully with the API.
    /// See [info here](https://developer.foursquare.com/reference/authentication)
    ///
    ///  This also builds up the full url based on the path params and query params passed by the caller
    ///
    /// - Parameter forPath: path to the specific API endpoint within the Foursquare Places API
    /// - Parameter withParams: Any query params needed to make the request
    /// - Returns: A URLRequest object with full url and Authorization header set, or nil if none can be successfully created
    private func authorizedPlacesRequest(forPath path: String, withParams params: [String: String]? = nil) -> URLRequest? {
        
        guard var urlComps = URLComponents(string: "https://api.foursquare.com/v3/places/\(path)") else { return nil }
        
        var queryParams: [URLQueryItem] = []
        if let params = params {
            for (key, value) in params {
                queryParams.append(URLQueryItem(name: key, value: value))
            }
            
            urlComps.queryItems = queryParams
        }
        
        guard let url = urlComps.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(Constants.API_KEY, forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
}

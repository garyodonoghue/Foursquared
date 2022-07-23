//
//  PlacesService.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import Foundation
import CoreLocation


/// Protocol providing a generic abstraction from 3rd party implementations which can be used to fetch place information.
protocol PlacesServiceProtocol {
    
    /// Get list of places around a certain location (provided as `location`), within a certain radius (provided as `radius`)
    /// - Parameters:
    ///   - location: The location to fetch the nearby locations to
    ///   - radius: A radius around the location for which to fetch the locations for
    /// - Returns: A `Result` containing either a list of `Place`s in the case of a successful call, or a `ServiceError` in the case of some failure
    func getPlaces(near location: CLLocationCoordinate2D, within radius: Int) async -> Result<[Place], ServiceError>
    
    /// Get images for a specific place
    /// - Parameter placeId: Id used to represent the place. This will be a 3rd party specific id
    /// - Returns: A `Result` containing either a collection of image URLs represented as `String`s in the case of a successful call, or a `ServiceError` in the case of some failure
    func getImages(for placeId: String) async -> Result<[String], ServiceError>
    
    /// Get specific details about a specific place
    /// - Parameter placeId: Id used to represent the place.  This will be a 3rd party specific id
    /// - Returns: A Result containing either a `PlaceDetail` object in the case of a successful call, or a `ServiceError` in the case of some failure
    func getPlaceDetails(for placeId: String) async -> Result<PlaceDetail, ServiceError>
}

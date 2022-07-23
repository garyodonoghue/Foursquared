//
//  PlaceDetailViewMoel.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 22/07/2022.
//

import Foundation
import SwiftUI

/// View Model associated with the Place Details view.
/// This ViewModel provides methods to fetch place details for a specific place
///
/// It also provides computed properties to reduce any calculation / computation / formatting in the View (UI)
@MainActor
class PlaceDetailsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var images: [String] = []
    @Published var details: PlaceDetail?
    @Published var isLoading: Bool = true
    
    // MARK: - Private properties
    private let service: PlacesServiceProtocol!
    private let place: Place!
    
    // MARK: - Initialiser
    init(place: Place, service: PlacesServiceProtocol) {
        self.service = service
        self.place = place
    }
    
    // MARK: - Public Properties
    
    var description: String? {
        return details?.description
    }
    
    var name: String {
        return place.name
    }
    
    var address: String {
        return place.address
    }
    
    var openingStatus: String? {
        guard let open = details?.open else {
            return nil
        }

        return open ? "OPEN" : "CLOSED"
    }
    
    var open: Bool? {
        return details?.open
    }

    var ratingColor: Color? {
        guard let rating = details?.rating,
                let colour = UIColor(hex: rating.hexColour) else {
            return nil
        }

        return Color(colour)
    }
    
    var rating: Double? {
        guard let rating = details?.rating else {
            return nil
        }

        return rating.ratingValue
    }
    
    var categoryImages: [String] {
        return place.categoryImages
    }
    
    // MARK: - Public functions
    
    func getDetails() {
        Task {
            let detailsResponse = await service.getPlaceDetails(for: place.apiId)
            do {
                details = try detailsResponse.get()
            } catch {
                print("Error from the get detail service call: \(error.localizedDescription)")
            }
            
            let imagesResponse = await service.getImages(for: place.apiId)
            do {
                images = try imagesResponse.get()
            } catch {
                print("Error from the get images service call: \(error.localizedDescription)")
            }
            
            isLoading = false
        }
    }
}

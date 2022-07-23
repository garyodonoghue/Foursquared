//
//  PlaceDetailViewMoel.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 22/07/2022.
//

import Foundation


@MainActor
class PlaceDetailsViewModel: ObservableObject {
    
    @Published var images: [String] = []
    @Published var details: PlaceDetail?
    @Published var isLoading: Bool = true
    
    let service: PlacesServiceProtocol!
    let place: Place!
    
    init(place: Place, service: PlacesServiceProtocol) {
        self.service = service
        self.place = place
    }
    
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

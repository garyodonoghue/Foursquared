//
//  PlacesViewModel.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import CoreLocation
import SwiftUI

@MainActor
/// View Model associated with the Place List view. This ViewModel handle the location updates and communicates
/// the changes in location or user permission to locations to the View
class PlacesListViewModel: NSObject, ObservableObject {
    
    @Published var places = [Place]()
    @Published var isLoading: Bool = false
    
    var location: CLLocationCoordinate2D?
    
    private let locationManager = CLLocationManager()
    var placesService: PlacesServiceProtocol!
    
    init(placesService: PlacesServiceProtocol) {
        super.init()
        self.placesService = placesService
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    
    /// Method used to fetch places within a certain radius of the user's location.
    /// - Parameter radius: Radius value to fetch the places within, defaults to 10 if none provided
    func fetchPlaces(within radius: Int = 10) {
        isLoading = true
        
        guard let location = location else {
            return
        }

        Task {
            let response = await placesService.getPlaces(near: location, within: radius)
            do {
                places = try response.get().sorted(by: { $0.distance < $1.distance })
                isLoading = false
            } catch {
                print("Error from the service call: \(error)")
            }
        }
    }
}

/// Extension used for conforming to the location delegate, to receieve updates on location and location based permission changes
extension PlacesListViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            guard let location = manager.location?.coordinate else { return }
            self.location = location
            fetchPlaces()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location?.coordinate else { return }
        self.location = location
        fetchPlaces()
    }
}

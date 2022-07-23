//
//  PlacesService.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import Foundation
import CoreLocation

protocol PlacesServiceProtocol {
    func getPlaces(near location: CLLocationCoordinate2D, within radius: Int) async -> Result<[Place], ServiceError>
    func getImages(for placeId: String) async -> Result<[String], ServiceError>
    func getPlaceDetails(for placeId: String) async -> Result<PlaceDetail, ServiceError>
}

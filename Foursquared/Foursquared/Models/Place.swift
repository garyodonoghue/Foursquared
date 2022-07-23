//
//  Place.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import CoreLocation

/**
  Model used to store information about a place
 */
struct Place: Identifiable {
    let id = UUID()
    
    /// Downstream API specific id used to represent this place. This would be a different value depending on the 3rd party API used
    let apiId: String
    
    /// The name of the place
    let name: String
    
    /// The location of the place, containing latitude/longitude information
    let location: CLLocationCoordinate2D
    
    /// The reader friendly value of the address of the place
    let address: String
    
    /// The distance (in metres) of the place from the user's location
    let distance: Int
    
    /// List of
    let categoryImages: [String]
}

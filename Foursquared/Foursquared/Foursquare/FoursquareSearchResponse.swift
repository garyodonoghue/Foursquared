//
//  FoursquarePlace.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import Foundation

/**
  This file stored a list of models  used to represent the response objects associated with the Foursquare Places API
  https://developer.foursquare.com/reference/place-search
 */


/// Response object used to represent the top level response from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct FoursquareSearchResponse: Codable {
    let results: [FoursquareSearchPlace]
}


/// Response object used to represent the Place information from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct FoursquareSearchPlace: Codable {
    let name: String
    let geocodes: Geocodes
    let location: FoursquareLocation
    let distance: Int
    let fsq_id: String
    let categories: [FoursquareCategory]
    var categoryImages: [String] {
        categories.map { category in
            "\(category.icon.prefix)bg_64\(category.icon.suffix)"
        }
    }
}

/// Response object used to represent the category information from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct FoursquareCategory: Codable {
    let name: String
    let icon: FourSquareCategoryIcon
}

/// Response object used to represent the category icon information from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct FourSquareCategoryIcon: Codable {
    let prefix: String
    let suffix: String
}

/// Response object used to represent the list of geocodes from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct Geocodes: Codable {
    let main: Geocode
}

/// Response object used to represent the geocode information from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct Geocode: Codable {
    let latitude: Double
    let longitude: Double
}

/// Response object used to represent the location information from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct FoursquareLocation: Codable {
    let formatted_address: String
}

/// Response object used to represent the photo information from calling the
/// [Fourquare Place Search API](https://developer.foursquare.com/reference/place-search)
struct FourSquarePhotoItem: Codable {
    let id: String
    let created_at: String
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}

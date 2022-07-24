//
//  PlaceDetail.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 22/07/2022.
//

import Foundation

/**
  Model used to store detailed information about a place
 */
struct PlaceDetail: Equatable {
    
    /// Whether a place is currently open or not, or nil if not known/not available
    let open: Bool?
    
    /// The rating of a place, or nil if not known/not available
    let rating: Rating?
    
    /// The description of a place
    let description: String?
    
    static func == (lhs: PlaceDetail, rhs: PlaceDetail) -> Bool {
        lhs.description == rhs.description
    }
}

/**
  Model used to store rating information about a place
 */
struct Rating {
    
    /// Numeric rating value of a place
    let ratingValue: Double
    
    /// Hex value for the colour associated with that rating. typical 3rd party services will have a numeric rating 1-10, and then a colour associated with that for red (being bad) and green (being good)
    let hexColour: String
}

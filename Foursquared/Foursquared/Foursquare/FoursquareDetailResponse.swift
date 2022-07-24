//
//  FoursquareDetailResponse.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 22/07/2022.
//

/// Response object used to represent the details object for a single Foursquare place,
/// using the [Place Details API](https://developer.foursquare.com/reference/place-details)
struct FoursquareDetailResponse: Codable {

    let rating: Double?
    let hours: FoursquareHoursObject?
    let description: String?
    
    /// Propertty used to represent the Foursquare rating on a red to green scale of of bad to good
    /// See the [Foursquare response fields documentation](https://developer.foursquare.com/reference/response-fields)
    var ratingColor: String? {
        guard let rating = rating else {
            return nil
        }

        if rating == 0 {
          return "D1D6D8"
        } else if rating <= 4.0 {
            return "E6092C"
        } else if rating <= 5.0 {
            return "FF6701"
        } else if rating <= 6.0 {
            return "FF9600"
        } else if rating <= 7.0 {
            return "FFC800"
        } else if rating <= 8.0 {
            return "C5DE35"
        } else if rating <= 9.0 {
            return "73CF42"
        } else if rating > 9.0 {
            return "00B551"
        } else {
            return "FFFFFF"
        }
    }
}

/// Response object representing the opening status information about a Fousquare place
struct FoursquareHoursObject: Codable {
    let open_now: Bool
}

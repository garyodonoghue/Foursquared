//
//  FoursquareDetailResponse.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 22/07/2022.
//

import UIKit

/// Response object used to represent the details object for a single Foursquare place,
/// using the [Place Details API](https://developer.foursquare.com/reference/place-details)
struct FoursquareDetailResponse: Codable {

    let rating: Double?
    let hours: FoursquareHoursObject?
    let description: String?
    
    /// Propertty used to represent the Foursquare rating on a red to green scale of of bad to good
    var ratingColor: UIColor? {
        guard let rating = rating else {
            return nil
        }

        if rating == 0 {
          return #colorLiteral(red: 0.8196078431, green: 0.8392156863, blue: 0.8470588235, alpha: 1)
        } else if rating <= 4.0 {
            return #colorLiteral(red: 0.9019607843, green: 0.03529411765, blue: 0.1725490196, alpha: 1)
        } else if rating <= 5.0 {
            return #colorLiteral(red: 1, green: 0.4039215686, blue: 0.003921568627, alpha: 1)
        } else if rating <= 6.0 {
            return #colorLiteral(red: 1, green: 0.5882352941, blue: 0, alpha: 1)
        } else if rating <= 7.0 {
            return #colorLiteral(red: 1, green: 0.7843137255, blue: 0, alpha: 1)
        } else if rating <= 8.0 {
            return #colorLiteral(red: 0.7725490196, green: 0.8705882353, blue: 0.2078431373, alpha: 1)
        } else if rating <= 9.0 {
            return #colorLiteral(red: 0.4509803922, green: 0.8117647059, blue: 0.2588235294, alpha: 1)
        } else if rating > 9.0 {
            return #colorLiteral(red: 0, green: 0.7098039216, blue: 0.3176470588, alpha: 1)
        } else {
            return #colorLiteral(red: 0.9411764706, green: 0.9529411765, blue: 0.9647058824, alpha: 1)
        }
    }
}

/// Response object representing the opening status information about a Fousquare place
struct FoursquareHoursObject: Codable {
    let open_now: Bool
}

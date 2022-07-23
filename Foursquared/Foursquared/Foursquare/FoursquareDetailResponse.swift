//
//  FoursquareDetailResponse.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 22/07/2022.
//

import Foundation

struct FoursquareDetailResponse: Codable {

    let rating: Double?
    let hours: FoursquareHoursObject?
    let description: String?
}

struct FoursquareHoursObject: Codable {
    let open_now: Bool
}

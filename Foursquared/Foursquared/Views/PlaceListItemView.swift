//
//  PlacesRow.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 20/07/2022.
//

import SwiftUI
import CoreLocation

/// View used to show some summary information about a place. Used in a `List` when showing a list of places
struct PlaceListItemView: View {
    
    var place: Place
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(place.name)
                    .font(.title3)
                
                Text(place.address)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 3)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)

             
                Text("\(String(place.distance))m away")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)

            }
        }
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListItemView(place: Place(apiId: "123ABC", name: "Test location", location: CLLocationCoordinate2D(latitude: 12.0, longitude: 123.23), address: "Da Costakade, Amsterdam", distance: 150, categoryImages: []))
    }
}

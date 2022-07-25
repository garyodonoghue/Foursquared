//
//  PlacesListView.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import SwiftUI

/// View showing the list of places around a user's location
struct PlacesListView: View {
    
    @ObservedObject private var viewModel: PlacesListViewModel
    @State private var radius: Double = 0
    
    private var placesService: PlacesServiceProtocol = FoursquarePlacesService()
    
    init() {
        viewModel = PlacesListViewModel(placesService: placesService)
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                NavigationView {
                    VStack {
                        List {
                            ForEach(viewModel.places) { place in
                                NavigationLink(destination: PlaceDetailView(viewModel: PlaceDetailsViewModel(place: place, service: placesService))) {
                                    PlaceListItemView(place: place)
                                }.padding()
                            }
                        }
                        .id(UUID())
                        .navigationTitle("Places near you")
                        .navigationBarTitleDisplayMode(.inline)
                        
                        Text("Control the radius of the search")
                            .padding()
                        
                        Slider(value: $radius, in: 10...1000)
                            .padding()
                            .onChange(of: radius, perform: sliderChanged)
                        
                        Text("Within \(Int(radius))m")
                    }
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
                         .frame(width: 50, height: 50)
                         .background(Color.white)
                         .cornerRadius(20)
                         .opacity(1)
                         .shadow(color: Color.gray.opacity(0.5), radius: 4.0, x: 1.0, y: 2.0)
            }
        }
    }
    
    private func sliderChanged(to newValue: Double) {
        viewModel.fetchPlaces(within: Int(newValue))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView()
    }
}


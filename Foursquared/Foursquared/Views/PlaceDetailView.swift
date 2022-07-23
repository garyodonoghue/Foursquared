//
//  PlaceDetail.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 22/07/2022.
//

import SwiftUI

/// View used to show an individual place's details, such as name, address, rating, and open status (open/closed)
struct PlaceDetailView: View {
    @ObservedObject var viewModel: PlaceDetailsViewModel
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    Text(viewModel.name)
                        .font(.title3)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    if let rating = viewModel.rating,
                       let color = viewModel.ratingColor {
                        Capsule()
                            .fill(color)
                            .overlay(
                                Text(String(rating))
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            )
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.top, 20)
                            .padding(.trailing, 20)
                    }
                }
                
                Text(viewModel.address)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.categoryImages, id: \.self) { categoryImageUrl in

                            AsyncImage(url: URL(string: categoryImageUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.bottom, 10)
                
                if let open = viewModel.open,
                    let openClosedText = viewModel.openingStatus {
                    Text(openClosedText)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(open ? Color.green : Color.red)
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                }
                
                if let description = viewModel.description, !description.isEmpty {
                    Text(description).padding(.leading, 20)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.images, id: \.self) { imageUrl in
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 300, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }.padding(.leading, 20)
                
                Spacer()
                
            }
            
            if(viewModel.isLoading) {
                ProgressView()
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .cornerRadius(20)
                    .opacity(1)
                    .shadow(color: Color.gray.opacity(0.5), radius: 4.0, x: 1.0, y: 2.0)
            }
        }.onAppear {
            viewModel.getDetails()
        }
    }
}

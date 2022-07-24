//
//  PlaceDetailsViewModelTests.swift
//  FoursquaredTests
//
//  Created by gary.odonoghue  on 23/07/2022.
//


import XCTest
import CoreLocation

let mockPlace = Place(apiId: "", name: "", location: CLLocationCoordinate2D(latitude: 12, longitude: 2), address: "123 fake street", distance: 1, categoryImages: [])
let mockPlaceDetail = PlaceDetail(open: true, rating: Rating(ratingValue: 8.9, hexColour: "#FFFFFF"), description: "")
let mockImageUrl = "http://123.com"

class PlaceDetailsViewModelTests: XCTestCase {
    
//    @MainActor func testAddress() throws {
//        
//        let service = MockPlacesService_Success()
//        let viewModel = PlaceDetailsViewModel(place: mockPlace, service: service)
//        
//        XCTAssertEqual(viewModel.address, "123 fake street")
//    }
//    
//    @MainActor func testOpenStatus() throws {
//        
//        let mockPlaceDetail = PlaceDetail(open: true, rating: Rating(ratingValue: 8.9, hexColour: "#FFFFFF"), description: "")
//        let service = MockPlacesService_Success()
//        let viewModel = PlaceDetailsViewModel(place: mockPlace, service: service)
//        viewModel.details = mockPlaceDetail
//        
//        XCTAssertEqual(viewModel.openingStatus, "OPEN")
//    }
//    
//    @MainActor func testClosedStatus() throws {
//        
//        let mockPlaceDetail = PlaceDetail(open: false, rating: Rating(ratingValue: 8.9, hexColour: "#FFFFFF"), description: "")
//        let service = MockPlacesService_Success()
//        let viewModel = PlaceDetailsViewModel(place: mockPlace, service: service)
//        viewModel.details = mockPlaceDetail
//        
//        XCTAssertEqual(viewModel.openingStatus, "CLOSED")
//    }
//    
//    @MainActor func testNilOpenStatus() throws {
//        
//        let mockPlaceDetail = PlaceDetail(open: nil, rating: Rating(ratingValue: 8.9, hexColour: "#FFFFFF"), description: "")
//        let service = MockPlacesService_Success()
//        let viewModel = PlaceDetailsViewModel(place: mockPlace, service: service)
//        viewModel.details = mockPlaceDetail
//        
//        XCTAssertNil(viewModel.openingStatus)
//    }
    
}

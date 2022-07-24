//
//  FoursquarePlacesServiceTests.swift
//  FoursquaredTests
//
//  Created by gary.odonoghue  on 24/07/2022.
//

import XCTest
import Cuckoo
import CoreLocation

class PlacePlacesServiceTests: XCTestCase {
    
    let mockSessionProtocol = MockFoursquaredSessionProtocol()
    var service: FoursquarePlacesService!
    
    override func setUp() async throws {
        service = FoursquarePlacesService(urlSession: mockSessionProtocol)
    }
    
    // MARK: - Place Details Tests
    func testGetPlaceDetailsError() async {
        
        stub(mockSessionProtocol) { stub in
            when(stub.data(for: any(URLRequest.self), delegate: any(URLSessionTaskDelegate.self))).thenThrow(ServiceError.serverError("error description"))
        }
        
        let result = await service.getPlaceDetails(for: "")
        if case .success = result {
            XCTFail("Expected to be a failure but got a success with \(result)")
        }
        
        XCTAssertThrowsError(try result.get())
    }
    
    func testGetPlaceDetailsSuccess() async {
        
        let mockJsonResponse = try! JSONEncoder().encode(FoursquareDetailResponse(rating: 8.9, hours: FoursquareHoursObject(open_now: true), description: "dummy description"))
        
        stub(mockSessionProtocol) { stub in
            when(stub.data(for: any(URLRequest.self), delegate: any(URLSessionTaskDelegate.self))).thenReturn((mockJsonResponse, URLResponse()))
        }
        
        let result = await service.getPlaceDetails(for: "")
        let details = try! result.get()
        XCTAssertEqual(details.description, "dummy description")
        XCTAssertTrue(details.open ?? false)
        XCTAssertEqual(details.rating!.ratingValue, 8.9)
        XCTAssertEqual(details.rating!.hexColour, "#73CF42")
    }
    
    func testGetPlacesSuccessHigherRating() async {
        
        let mockJsonResponse = try! JSONEncoder().encode(FoursquareDetailResponse(rating: 9.9, hours: FoursquareHoursObject(open_now: true), description: "some description"))
        
        stub(mockSessionProtocol) { stub in
            when(stub.data(for: any(URLRequest.self), delegate: any(URLSessionTaskDelegate.self))).thenReturn((mockJsonResponse, URLResponse()))
        }
        
        let result = await service.getPlaceDetails(for: "")
        let details = try! result.get()
        XCTAssertEqual(details.rating!.ratingValue, 9.9)
        XCTAssertEqual(details.rating!.hexColour, "#00B551")
    }
    
    // MARK: - Get Images Tests
    
    func testGetImagesError() async {
        
        stub(mockSessionProtocol) { stub in
            when(stub.data(for: any(URLRequest.self), delegate: any(URLSessionTaskDelegate.self))).thenThrow(ServiceError.serverError("error description"))
        }
        
        let result = await service.getImages(for: "")
        if case .success = result {
            XCTFail("Expected to be a failure but got a success with \(result)")
        }
        
        XCTAssertThrowsError(try result.get())
    }
    
    func testGetImagesSuccess() async {
        
        let mockJsonResponse = try! JSONEncoder().encode([FourSquarePhotoItem(id: "123", created_at: "10-23-2020", prefix: "http://", suffix: ".png", width: 200, height: 200)])
        
        stub(mockSessionProtocol) { stub in
            when(stub.data(for: any(URLRequest.self), delegate: any(URLSessionTaskDelegate.self))).thenReturn((mockJsonResponse, URLResponse()))
        }
        
        let result = await service.getImages(for: "")
        let images = try! result.get()
        XCTAssertEqual(images.count, 1)
        XCTAssertEqual(images[0], "http://original.png")
    }
    
    // MARK: - Get Places Tests
    
    func testGetPlacesSuccess() async {
        
        let mockJsonResponse = try! JSONEncoder().encode(FoursquareSearchResponse(results: [FoursquareSearchPlace(name: "place 123", geocodes: Geocodes(main: Geocode(latitude: 12.13, longitude: 43.32)), location: FoursquareLocation(formatted_address: "place 123, 5292AB, Amsterdam"), distance: 100, fsq_id: "12345", categories: [FoursquareCategory(name: "category 1", icon: FourSquareCategoryIcon(prefix: "park", suffix: ".png"))])]))
        
        stub(mockSessionProtocol) { stub in
            when(stub.data(for: any(URLRequest.self), delegate: any(URLSessionTaskDelegate.self))).thenReturn((mockJsonResponse, URLResponse()))
        }
        
        let result = await service.getPlaces(near: CLLocationCoordinate2D(latitude: 12.1, longitude: 56.43), within: 10)
        let places = try! result.get()
        XCTAssertEqual(places.count, 1)
        XCTAssertEqual(places[0].address, "place 123, 5292AB, Amsterdam")
        XCTAssertEqual(places[0].name, "place 123")
        XCTAssertEqual(places[0].apiId, "12345")
    
    }
    
    func testGetPlacesError() async {
        
        stub(mockSessionProtocol) { stub in
            when(stub.data(for: any(URLRequest.self), delegate: any(URLSessionTaskDelegate.self))).thenThrow(ServiceError.serverError("error description"))
        }
        
        let result = await service.getPlaces(near: CLLocationCoordinate2D(latitude: 12.1, longitude: 56.43), within: 10)
        if case .success = result {
            XCTFail("Expected to be a failure but got a success with \(result)")
        }
        
        XCTAssertThrowsError(try result.get())
    }
}

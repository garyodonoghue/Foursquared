// MARK: - Mocks generated from file: Foursquared/API/FoursquaredSessionProtocol.swift at 2022-07-24 13:39:08 +0000

//
//  HTTPClient.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 23/07/2022.
//

import Cuckoo
@testable import Foursquared

import Foundation






 class MockFoursquaredSessionProtocol: FoursquaredSessionProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = FoursquaredSessionProtocol
    
     typealias Stubbing = __StubbingProxy_FoursquaredSessionProtocol
     typealias Verification = __VerificationProxy_FoursquaredSessionProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FoursquaredSessionProtocol?

     func enableDefaultImplementation(_ stub: FoursquaredSessionProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        
    return try await cuckoo_manager.callThrows(
    """
    data(for: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    """,
            parameters: (request, delegate),
            escapingParameters: (request, delegate),
            superclassCall:
                
                await Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: await __defaultImplStub!.data(for: request, delegate: delegate))
        
    }
    
    

     struct __StubbingProxy_FoursquaredSessionProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func data<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(for request: M1, delegate: M2) -> Cuckoo.ProtocolStubThrowingFunction<(URLRequest, URLSessionTaskDelegate?), (Data, URLResponse)> where M1.MatchedType == URLRequest, M2.OptionalMatchedType == URLSessionTaskDelegate {
            let matchers: [Cuckoo.ParameterMatcher<(URLRequest, URLSessionTaskDelegate?)>] = [wrap(matchable: request) { $0.0 }, wrap(matchable: delegate) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockFoursquaredSessionProtocol.self, method:
    """
    data(for: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_FoursquaredSessionProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func data<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(for request: M1, delegate: M2) -> Cuckoo.__DoNotUse<(URLRequest, URLSessionTaskDelegate?), (Data, URLResponse)> where M1.MatchedType == URLRequest, M2.OptionalMatchedType == URLSessionTaskDelegate {
            let matchers: [Cuckoo.ParameterMatcher<(URLRequest, URLSessionTaskDelegate?)>] = [wrap(matchable: request) { $0.0 }, wrap(matchable: delegate) { $0.1 }]
            return cuckoo_manager.verify(
    """
    data(for: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}

 class FoursquaredSessionProtocolStub: FoursquaredSessionProtocol {
    

    

    
    
    
    
     func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)  {
        return DefaultValueRegistry.defaultValue(for: ((Data, URLResponse)).self)
    }
    
    
}





// MARK: - Mocks generated from file: Foursquared/API/PlacesService.swift at 2022-07-24 13:39:08 +0000

//
//  PlacesService.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 19/07/2022.
//

import Cuckoo
@testable import Foursquared

import CoreLocation
import Foundation






 class MockPlacesServiceProtocol: PlacesServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = PlacesServiceProtocol
    
     typealias Stubbing = __StubbingProxy_PlacesServiceProtocol
     typealias Verification = __VerificationProxy_PlacesServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PlacesServiceProtocol?

     func enableDefaultImplementation(_ stub: PlacesServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    
     func getPlaces(near location: CLLocationCoordinate2D, within radius: Int) async -> Result<[Place], ServiceError> {
        
    return await cuckoo_manager.call(
    """
    getPlaces(near: CLLocationCoordinate2D, within: Int) async -> Result<[Place], ServiceError>
    """,
            parameters: (location, radius),
            escapingParameters: (location, radius),
            superclassCall:
                
                await Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: await __defaultImplStub!.getPlaces(near: location, within: radius))
        
    }
    
    
    
    
    
     func getImages(for placeId: String) async -> Result<[String], ServiceError> {
        
    return await cuckoo_manager.call(
    """
    getImages(for: String) async -> Result<[String], ServiceError>
    """,
            parameters: (placeId),
            escapingParameters: (placeId),
            superclassCall:
                
                await Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: await __defaultImplStub!.getImages(for: placeId))
        
    }
    
    
    
    
    
     func getPlaceDetails(for placeId: String) async -> Result<PlaceDetail, ServiceError> {
        
    return await cuckoo_manager.call(
    """
    getPlaceDetails(for: String) async -> Result<PlaceDetail, ServiceError>
    """,
            parameters: (placeId),
            escapingParameters: (placeId),
            superclassCall:
                
                await Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: await __defaultImplStub!.getPlaceDetails(for: placeId))
        
    }
    
    

     struct __StubbingProxy_PlacesServiceProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
         init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        
        
        func getPlaces<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(near location: M1, within radius: M2) -> Cuckoo.ProtocolStubFunction<(CLLocationCoordinate2D, Int), Result<[Place], ServiceError>> where M1.MatchedType == CLLocationCoordinate2D, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(CLLocationCoordinate2D, Int)>] = [wrap(matchable: location) { $0.0 }, wrap(matchable: radius) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub(for: MockPlacesServiceProtocol.self, method:
    """
    getPlaces(near: CLLocationCoordinate2D, within: Int) async -> Result<[Place], ServiceError>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getImages<M1: Cuckoo.Matchable>(for placeId: M1) -> Cuckoo.ProtocolStubFunction<(String), Result<[String], ServiceError>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: placeId) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockPlacesServiceProtocol.self, method:
    """
    getImages(for: String) async -> Result<[String], ServiceError>
    """, parameterMatchers: matchers))
        }
        
        
        
        
        func getPlaceDetails<M1: Cuckoo.Matchable>(for placeId: M1) -> Cuckoo.ProtocolStubFunction<(String), Result<PlaceDetail, ServiceError>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: placeId) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockPlacesServiceProtocol.self, method:
    """
    getPlaceDetails(for: String) async -> Result<PlaceDetail, ServiceError>
    """, parameterMatchers: matchers))
        }
        
        
    }

     struct __VerificationProxy_PlacesServiceProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
         init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
    
        
    
        
        
        
        @discardableResult
        func getPlaces<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(near location: M1, within radius: M2) -> Cuckoo.__DoNotUse<(CLLocationCoordinate2D, Int), Result<[Place], ServiceError>> where M1.MatchedType == CLLocationCoordinate2D, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(CLLocationCoordinate2D, Int)>] = [wrap(matchable: location) { $0.0 }, wrap(matchable: radius) { $0.1 }]
            return cuckoo_manager.verify(
    """
    getPlaces(near: CLLocationCoordinate2D, within: Int) async -> Result<[Place], ServiceError>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getImages<M1: Cuckoo.Matchable>(for placeId: M1) -> Cuckoo.__DoNotUse<(String), Result<[String], ServiceError>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: placeId) { $0 }]
            return cuckoo_manager.verify(
    """
    getImages(for: String) async -> Result<[String], ServiceError>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
        
        
        @discardableResult
        func getPlaceDetails<M1: Cuckoo.Matchable>(for placeId: M1) -> Cuckoo.__DoNotUse<(String), Result<PlaceDetail, ServiceError>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: placeId) { $0 }]
            return cuckoo_manager.verify(
    """
    getPlaceDetails(for: String) async -> Result<PlaceDetail, ServiceError>
    """, callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        
    }
}

 class PlacesServiceProtocolStub: PlacesServiceProtocol {
    

    

    
    
    
    
     func getPlaces(near location: CLLocationCoordinate2D, within radius: Int) async -> Result<[Place], ServiceError>  {
        return DefaultValueRegistry.defaultValue(for: (Result<[Place], ServiceError>).self)
    }
    
    
    
    
    
     func getImages(for placeId: String) async -> Result<[String], ServiceError>  {
        return DefaultValueRegistry.defaultValue(for: (Result<[String], ServiceError>).self)
    }
    
    
    
    
    
     func getPlaceDetails(for placeId: String) async -> Result<PlaceDetail, ServiceError>  {
        return DefaultValueRegistry.defaultValue(for: (Result<PlaceDetail, ServiceError>).self)
    }
    
    
}





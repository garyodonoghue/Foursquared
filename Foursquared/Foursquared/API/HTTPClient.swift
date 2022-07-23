//
//  HTTPClient.swift
//  Foursquared
//
//  Created by gary.odonoghue  on 23/07/2022.
//

import Foundation

/// Protocol used to interact with APIs, allows mocking of the URLSession layer
protocol MyUrlSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}


/// Extension used to provide a default value for `delegate` when using `MyUrlSessionProtocol`, so as not to force the caller to provide a value or nil
extension MyUrlSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: delegate)
    }
}

/// Conform to our `MyUrlSessionProtocol` so that the API layer can be mocked for unit testing in the application
extension URLSession: MyUrlSessionProtocol {}

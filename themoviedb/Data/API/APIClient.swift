//
//  APIClient.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Combine

protocol APIClient {
    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, APIError>
}

//
//  APIError.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation

enum APIError: Error {
    case networkError(Error)
    case invalidResponse
    case invalidRequest
    case decodingError(Error)
    case tokenExpired
}

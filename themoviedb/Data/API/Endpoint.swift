//
//  Endpoint.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Alamofire

protocol Endpoint {
    func asURLRequest() throws -> URLRequest
}

enum TMDBEndpoint: Endpoint {
    case fetchMovies(page: Int)
    case refreshToken(refreshToken: String)
    
    var baseURLString: String {
        "https://api.themoviedb.org/"
    }

    var path: String {
        switch self {
        case .fetchMovies(let page):
            return "3/discover/movie?include_adult=false&include_video=false&language=en-US&page=\(page)&sort_by=popularity.desc"
        case .refreshToken:
            return "3/auth/refresh"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMovies:
            return HTTPMethod.get
        case .refreshToken:
            return HTTPMethod.post
        }
    }
    
    var headers: [String: String] {
        [
            "Content-Type": "application/json; charset=UTF-8",
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTU2MDE1OWNmYWM3ZTcwMzcyOGIxMmNiOTE3MzBhZiIsIm5iZiI6MTcyMDg3NDg4NS4yMzc2MTYsInN1YiI6IjY2OTI3NmMwMWVkOTIxZDYzNWUyODJhOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f_8NGMOLSK9Vg6fzayOgVVnEkwRXsSOgtcrxB2GbQLI"
        ]
    }
    
    var params: [String: Any] {
        [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = self.baseURLString.appending(path).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlString)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue.uppercased()
        urlRequest.allHTTPHeaderFields = headers
        
        if method == .get {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: params)
        } else {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        
        return urlRequest
    }
}

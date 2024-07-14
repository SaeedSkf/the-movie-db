//
//  MovieAPIService.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import Foundation
import Combine

protocol MovieAPIService {
    func fetchMovies(query: String) -> AnyPublisher<[MovieDTO], APIError>
}

struct BaseMovieAPIService: MovieAPIService {
    let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func fetchMovies(query: String) -> AnyPublisher<[MovieDTO], APIError> {
        client.request(TMDBEndpoint.fetchMovies)
    }
}

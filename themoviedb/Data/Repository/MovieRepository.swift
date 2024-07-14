//
//  MovieRepository.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import Foundation
import Combine

protocol MovieRepository {
    func fetchMovies(query: String) -> AnyPublisher<[Movie], APIError>
}

struct RemoteMovieRepository: MovieRepository {
    let service: MovieAPIService
    
    init(service: MovieAPIService) {
        self.service = service
    }
    
    func fetchMovies(query: String) -> AnyPublisher<[Movie], APIError> {
        service.fetchMovies(query: query)
            .map { dtos in
                dtos.map { dto in
                    Movie(
                        id: dto.id,
                        title: dto.title,
                        poster: URL(string: dto.posterPath),
                        releaseDate: Date(),
                        desctiption: dto.overview
                    )
                }
            }
            .eraseToAnyPublisher()
    }
}

//
//  FetchMovieUseCase.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import Foundation
import Combine

protocol FetchMovieUseCase {
    func execute(query: String) -> AnyPublisher<[Movie], APIError>
}

struct BaseFetchMovieUseCase: FetchMovieUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(query: String) -> AnyPublisher<[Movie], APIError> {
        movieRepository.fetchMovies(query: query)
    }
}

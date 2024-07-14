//
//  FetchMovieUseCase.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import Foundation
import Combine

protocol FetchMoviesUseCase {
    func execute(query: String) -> AnyPublisher<[Movie], APIError>
}

struct BaseFetchMoviesUseCase: FetchMoviesUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(query: String) -> AnyPublisher<[Movie], APIError> {
        movieRepository.fetchMovies(query: query)
    }
}

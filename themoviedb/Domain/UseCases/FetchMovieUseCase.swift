//
//  FetchMovieUseCase.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import Foundation
import Combine

protocol FetchMovieUseCase {
    func execute(page: Int) -> AnyPublisher<Pager<Movie>, APIError>
}

struct BaseFetchMovieUseCase: FetchMovieUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(page: Int) -> AnyPublisher<Pager<Movie>, APIError> {
        movieRepository.fetchMovies(page: page)
    }
}

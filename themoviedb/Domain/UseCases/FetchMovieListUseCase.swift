//
//  FetchMovieListUseCase.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Combine

protocol FetchMovieListUseCase {
    func execute(page: Int) -> AnyPublisher<Pager<Movie>, APIError>
}

struct BaseFetchMovieListUseCase: FetchMovieListUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(page: Int) -> AnyPublisher<Pager<Movie>, APIError> {
        movieRepository.fetchMovies(page: page)
    }
}

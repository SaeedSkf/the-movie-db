//
//  MovieRepository.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import Foundation
import Combine

protocol MovieRepository {
    func fetchMovies(page: Int) -> AnyPublisher<Pager<Movie>, APIError>
}

struct RemoteMovieRepository: MovieRepository {
    let service: MovieAPIService
    
    init(service: MovieAPIService) {
        self.service = service
    }
    
    func fetchMovies(page: Int) -> AnyPublisher<Pager<Movie>, APIError> {
        service.fetchMovies(page: page)
            .map({ pager in
                Pager<Movie>(
                    isEndOfPage: pager.page == pager.totalPages,
                    result: pager.results.map { dto in
                        Movie(
                            id: dto.id,
                            title: dto.title,
                            poster: URL(string: "https://api.themoviedb.org\(dto.posterPath)"),
                            releaseDate: Date(),
                            desctiption: dto.overview
                        )
                    }
                )
            })
            .eraseToAnyPublisher()
    }
}

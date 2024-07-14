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
                            title: dto.title ?? "unkown",
                            poster: URL(string: "https://image.tmdb.org/t/p/w500_and_h200_face/\(dto.posterPath ?? "defaultImage.jpg")"),
                            thumbnail: URL(string: "https://image.tmdb.org/t/p/w50_and_h50_face/\(dto.posterPath ?? "defaultImage.jpg")"),
                            releaseDate: Date(),
                            desctiption: dto.overview ?? "unkown"
                        )
                    }
                )
            })
            .eraseToAnyPublisher()
    }
}

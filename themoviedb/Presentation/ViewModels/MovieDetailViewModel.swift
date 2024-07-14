//
//  MovieDetailViewModel.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieDetailViewModel: BaseViewModel {
    private let fetchMovieUseCase: FetchMovieUseCase
    let movie: Movie
    
    init(movie: Movie, fetchMovieUseCase: FetchMovieUseCase) {
        self.movie = movie
        self.fetchMovieUseCase = fetchMovieUseCase
    }
}

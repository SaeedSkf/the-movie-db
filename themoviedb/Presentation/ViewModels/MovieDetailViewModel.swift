//
//  MovieDetailViewModel.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieDetailViewModel: BaseViewModel {
    private let fetchMovieUseCase: FetchMovieUseCase
    
    init(fetchMovieUseCase: FetchMovieUseCase) {
        self.fetchMovieUseCase = fetchMovieUseCase
    }
}

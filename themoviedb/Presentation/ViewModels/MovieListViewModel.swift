//
//  MovieListViewModel.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieListViewModel: BaseViewModel {
    private let fetchMovieListUseCase: FetchMovieListUseCase
    
    init(fetchMovieListUseCase: FetchMovieListUseCase) {
        self.fetchMovieListUseCase = fetchMovieListUseCase
    }
}

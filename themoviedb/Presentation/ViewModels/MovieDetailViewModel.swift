//
//  MovieDetailViewModel.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieDetailViewModel: BaseViewModel {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}

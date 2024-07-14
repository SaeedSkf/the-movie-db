//
//  MovieDetailAssembly.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Swinject
import Alamofire

final class MovieDetailAssembly: Assembly {
    func assemble(container: Container) {        
        container.register(MovieDetailViewModel.self) { res, movie in
            MovieDetailViewModel(movie: movie)
        }
    }
}

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
        container.register(FetchMovieUseCase.self) { res in
            BaseFetchMovieUseCase(movieRepository: res.resolve(MovieRepository.self)!)
        }
        
        container.register(MovieDetailViewModel.self) { res in
            MovieDetailViewModel(fetchMovieUseCase: res.resolve(FetchMovieUseCase.self)!)
        }
    }
}

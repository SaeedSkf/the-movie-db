//
//  MovieAssembly.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Swinject
import Alamofire

final class MovieListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FetchMovieListUseCase.self) { res in
            BaseFetchMovieListUseCase(movieRepository: res.resolve(MovieRepository.self)!)
        }
        
        container.register(MovieListViewModel.self) { res in
            MovieListViewModel(fetchMovieListUseCase: res.resolve(FetchMovieListUseCase.self)!)
        }
    }
}

//
//  MovieListViewModel.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit
import Combine

final class MovieListViewModel: BaseViewModel {
    private let fetchMovieListUseCase: FetchMovieListUseCase
    var cancellables = Set<AnyCancellable>()
    
    init(fetchMovieListUseCase: FetchMovieListUseCase) {
        self.fetchMovieListUseCase = fetchMovieListUseCase
    }
    
    func fetchMovies() {
        fetchMovieListUseCase.execute(page: 1)
            .receive(on: RunLoop.main)
            .sinkToResult { result in
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
                }
            }
            .store(in: &cancellables)
    }
}


extension Publisher {
    func sinkToResult(_ result: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
        return sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                result(.failure(error))
            default: break
            }
        }, receiveValue: { value in
            result(.success(value))
        })
    }
}

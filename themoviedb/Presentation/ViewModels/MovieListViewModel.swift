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
    
    private var currentPage = 1
    private var isEndOfPages = false
    
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var updateTable: Void = ()
    
    private(set) var movies: [Movie] = [] {
        didSet {
            updateTable = ()
        }
    }
    
    var cancellables = Set<AnyCancellable>()
    
    init(fetchMovieListUseCase: FetchMovieListUseCase) {
        self.fetchMovieListUseCase = fetchMovieListUseCase
    }
    
    private func fetchMovies(page: Int, completion: @escaping ([Movie])->Void) {
        guard !isLoading, !isEndOfPages else {
            return
        }
        
        isLoading = true
        fetchMovieListUseCase.execute(page: page)
            .sinkToResult { [weak self] result in
                self?.isLoading = false
                switch result {
                case .success(let data):
                    self?.isEndOfPages = data.isEndOfPage
                    completion(data.result)
                case .failure(let failure):
                    print(failure)
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchFirstPage() {
        fetchMovies(page: 1) { [weak self] movies in
            self?.currentPage = 1
            self?.movies = movies
        }
    }
    
    func fetchNextPage() {
        let page = currentPage + 1
        fetchMovies(page: page) { [weak self] movies in
            self?.currentPage = page
            self?.movies.append(contentsOf: movies)
        }
    }
}

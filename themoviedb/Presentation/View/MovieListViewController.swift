//
//  MovieListViewController.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit
import Combine

protocol MovieListViewControllerRouterDelegate: AnyObject {
    func showMovieDetail(movie: Movie)
}

final class MovieListViewController: BaseViewController {
    var viewModel: MovieListViewModel!
    weak var routerDelegate: MovieListViewControllerRouterDelegate?
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .medium)
    }()
    
    private lazy var tableView: UITableView = {
        var tbl = UITableView(frame: self.view.bounds, style: .plain)
        tbl.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.prefetchDataSource = self
        tbl.dataSource = self
        tbl.delegate = self
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = tableView
        self.title = "Search"
        // Just a simple way to show data is loading ;)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        
        bindViewModel()
        viewModel.fetchFirstPage()
    }
    
    func bindViewModel() {
        viewModel.$isLoading
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
            .store(in: &viewModel.cancellables)
        
        // We can pass array list of changes in this section
        // then update table view just for these indexes
        // But, now we keep simple in here
        viewModel.$updateTable
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
    }
    
}


extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = viewModel.movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        routerDelegate?.showMovieDetail(movie: movie)
    }
}


extension MovieListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let needsFetch = indexPaths.contains { $0.row >= viewModel.movies.count - 1 }
        if needsFetch {
            viewModel.fetchNextPage()
        }
    }
}

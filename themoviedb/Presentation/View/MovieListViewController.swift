//
//  MovieListViewController.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

protocol MovieListViewControllerRouterDelegate: AnyObject {
    func showMovieDetail(movie: Movie)
}

final class MovieListViewController: BaseViewController {
    var viewModel: MovieListViewModel!
    weak var routerDelegate: MovieListViewControllerRouterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addButton()
        viewModel.fetchMovies()
    }
    
    func addButton() {
        let btn = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 30))
        btn.setTitle("salam", for: .normal) // Use .normal for default state
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func buttonTapped() {
//        let mock = Movie(id: 1, title: "", poster: nil, releaseDate: Date(), desctiption: "")
//        routerDelegate?.showMovieDetail(movie: mock)
        viewModel.fetchMovies()
    }
    
}

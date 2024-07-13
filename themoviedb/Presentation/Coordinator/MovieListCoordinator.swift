//
//  MovieListCoordinator.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieListCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MovieListViewController()
        viewController.viewModel = MovieListViewModel()
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showMovieDetail(movie: Movie) {
        let coordinator = MovieDetailsCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}

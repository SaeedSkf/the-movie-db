//
//  MovieListCoordinator.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieListCoordinator: Coordinator {
    private let router: Router
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?

    init(router: Router) {
        self.router = router
    }

    func start() {
        let viewController = MovieListViewController()
        viewController.viewModel = AppContainer.resolve()
        viewController.routerDelegate = self
        router.push(viewController, animated: true)
    }
}

extension MovieListCoordinator: MovieListViewControllerRouterDelegate {
    func showMovieDetail(movie: Movie) {
        let coordinator = MovieDetailCoordinator(movie: movie, router: router)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

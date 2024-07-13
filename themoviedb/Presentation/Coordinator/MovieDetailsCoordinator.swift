//
//  MovieDetailsCoordinator.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieDetailCoordinator: Coordinator {
    private let router: Router
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?

    init(router: Router) {
        self.router = router
    }

    func start() {
        let viewController = MovieDetailViewController()
        viewController.viewModel = MovieDetailViewModel()
        viewController.routerDelegate = self
        router.push(viewController, animated: true)
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}

extension MovieDetailCoordinator: MovieDetailViewControllerRouterDelegate {
    func back() {
        router.pop(animated: true)
        didFinish()
    }
}

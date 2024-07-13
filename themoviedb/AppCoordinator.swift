//
//  AppCoordinator.swift
//  themoviedb
//
//  Created by Saeed on 7/11/24.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let router: Router

    init(navigationController: UINavigationController) {
        self.router = BaseRouter(navigationController: navigationController)
    }

    func start() {
        let movieListCoordinator = MovieListCoordinator(router: router)
        childCoordinators.append(movieListCoordinator)
        movieListCoordinator.parentCoordinator = self
        movieListCoordinator.start()
    }
}

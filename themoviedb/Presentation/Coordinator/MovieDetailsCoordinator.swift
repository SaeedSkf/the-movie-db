//
//  MovieDetailsCoordinator.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

final class MovieDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MovieDetailViewController()
        viewController.viewModel = MovieDetailViewModel()
        navigationController.pushViewController(viewController, animated: false)
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}

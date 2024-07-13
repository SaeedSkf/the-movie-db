//
//  MovieListCoordinator.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

class MovieListCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        navigationController.pushViewController(viewController, animated: false)
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}

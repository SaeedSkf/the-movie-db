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
    let movie: Movie

    init(movie: Movie, router: Router) {
        self.movie = movie
        self.router = router
    }

    func start() {
        let viewController = MovieDetailViewController()
        viewController.viewModel = AppContainer.resolver.resolve(MovieDetailViewModel.self, argument: movie)
        viewController.routerDelegate = self
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        router.present(navigationController, animated: true, completion: nil)
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}

extension MovieDetailCoordinator: MovieDetailViewControllerRouterDelegate {
    func close() {
        router.dismiss(animated: true) { [weak self] in
            self?.didFinish()
        }
    }
}

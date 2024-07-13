//
//  BaseRouter.swift
//  themoviedb
//
//  Created by Saeed on 7/11/24.
//

import UIKit

protocol Router {
    var navigationController: UINavigationController { get set }
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

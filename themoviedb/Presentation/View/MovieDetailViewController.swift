//
//  MovieDetailViewController.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import UIKit

protocol MovieDetailViewControllerRouterDelegate: AnyObject {
    func back()
}

final class MovieDetailViewController: BaseViewController {
    
    var viewModel: MovieDetailViewModel!
    weak var routerDelegate: MovieDetailViewControllerRouterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        addButton()
    }
    
    func addButton() {
        let btn = UIButton(frame: .init(origin: .init(x: 100, y: 300), size: .init(width: 100, height: 30)))
        btn.setTitle("khodafez", for: [])
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func buttonTapped() {
        routerDelegate?.back()
    }
    
}

//
//  AppContainer.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Swinject

final class AppContainer {
    static let shared = AppContainer()
    
    static var resolver: Resolver {
        shared.assembler.resolver
    }
    
    static func resolve<T>() -> T {
        shared.assembler.resolver.resolve(T.self)!
    }
    
    let container = Container()
    let assembler: Assembler
    
    private init() {
        self.assembler = Assembler(
            [
                AppAssembly(),
                MovieListAssembly(),
                MovieDetailAssembly()
            ],
            container: container
        )
    }
}

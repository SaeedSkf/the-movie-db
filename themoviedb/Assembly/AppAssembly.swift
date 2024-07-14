//
//  AppAssembly.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Swinject
import Alamofire

final class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Session.self) { res in
            Session()
        }
        
        container.register(APIClient.self) { res in
            AlamofireApiClient(session: res.resolve(Session.self)!)
        }
        
        container.register(MovieAPIService.self) { res in
            BaseMovieAPIService(client: res.resolve(APIClient.self)!)
        }
        
        container.register(MovieRepository.self) { res in
            RemoteMovieRepository(service: res.resolve(MovieAPIService.self)!)
        }
    }
}

//
//  AlamofireAPIClient.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation
import Alamofire
import Combine

struct AlamofireApiClient: APIClient {
    private let session: Session
    private let decoder: JSONDecoder
    
    public init(session: Session, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func request<T>(_ endpoint: Endpoint) -> AnyPublisher<T, APIError> where T : Decodable {
        Future { promise in
            guard let urlRequest = try? endpoint.asURLRequest() else {
                promise(.failure(APIError.invalidRequest))
                return
            }
            
            self.session.request(urlRequest)
                .validate()
                .responseData(emptyResponseCodes: [200, 204, 205]) { response in
                    switch response.result {
                    case .success(let value):
                        do {
                            let model = try self.decoder.decode(T.self, from: value)
                            promise(.success(model))
                        } catch let error {
                            promise(.failure(.decodingError(error)))
                        }
                    case .failure(let error):
                        promise(.failure(.networkError(error)))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}

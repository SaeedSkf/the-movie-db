//
//  PageDTO.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation

struct PagerContainerDTO<T: Decodable>: Decodable {
    let results: [T]
    let page: Int
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

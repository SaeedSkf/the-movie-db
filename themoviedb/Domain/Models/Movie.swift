//
//  Movie.swift
//  themoviedb
//
//  Created by Saeed on 7/13/24.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let poster: URL?
    let thumbnail: URL?
    let releaseDate: Date
    let desctiption: String
}

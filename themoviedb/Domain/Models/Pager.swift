//
//  Pager.swift
//  themoviedb
//
//  Created by Saeed on 7/14/24.
//

import Foundation

struct Pager<T: Codable>: Codable {
    let isEndOfPage: Bool
    let result: [T]
}

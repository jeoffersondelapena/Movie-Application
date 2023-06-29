//
//  BaseResponse.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let page: Int
    let results: T
    let totalPages: Int
    let totalResults: Int
}

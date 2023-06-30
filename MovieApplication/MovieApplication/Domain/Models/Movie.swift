//
//  Movie.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let releaseDate: Date?
    let description: String
    let rating: Double
    let reviewsCount: Int
}

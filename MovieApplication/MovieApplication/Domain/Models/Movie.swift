//
//  Movie.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct Movie: Identifiable {

    struct Rating {
        let ratingAverage: Double
        let ratingCount: Int
    }

    let id: Int
    let title: String
    let description: String
    let releaseDate: Date?
    let rating: Rating

    static let sample = Movie(
        id: -1,
        title: "Movie Title",
        description: "Movie Description",
        releaseDate: Date(),
        rating: Rating(
            ratingAverage: 10.0,
            ratingCount: 100
        )
    )
}

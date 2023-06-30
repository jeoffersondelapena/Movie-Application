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

        static let sample = Rating(
            ratingAverage: 10.0,
            ratingCount: 100
        )

        func toString() -> String {
            L10n.Label.ratingString(
                ratingAverage,
                ratingCount.applyCommas() ?? ratingCount
            )
        }
    }

    let id: Int
    let title: String
    let posterURL: URL?
    let backdropURL: URL?
    let description: String
    let releaseDate: Date?
    let rating: Rating

    static let sample = Movie(
        id: -1,
        title: "Movie Title",
        posterURL: nil,
        backdropURL: nil,
        description: "Movie Description",
        releaseDate: Date(),
        rating: Rating.sample
    )
}

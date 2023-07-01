//
//  Media.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct Media: Identifiable {
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
    let type: MediaType
    let title: String
    let posterURL: URL?
    let backdropURL: URL?
    let description: String
    let releaseDate: Date?
    let rating: Rating

    static let sample = Media(
        id: -1,
        type: .movie,
        title: "Title",
        posterURL: URL(string: L10n.Sample.url),
        backdropURL: nil,
        description: "Description",
        releaseDate: Date(),
        rating: Rating.sample
    )
}

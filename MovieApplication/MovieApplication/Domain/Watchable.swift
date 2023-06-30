//
//  Watchable.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct Watchable: Identifiable {
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
    let type: WatchableType
    let title: String
    let posterURL: URL?
    let backdropURL: URL?
    let description: String
    let releaseDate: Date?
    let rating: Rating

    static let sample = Watchable(
        id: -1,
        type: .movie,
        title: "Title",
        posterURL: nil,
        backdropURL: nil,
        description: "Description",
        releaseDate: Date(),
        rating: Rating.sample
    )
}

//
//  GetSeriesResponse.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct GetSeriesResponse: Codable {
    let backdropPath: String?
    let firstAirDate: String
    let genreIds: [Int]
    let id: Int
    let name: String
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Double
    let voteCount: Int

    func toDomain(withNewEpisodes: Bool) -> Show {
        var posterURL: URL?
        if let posterPath = posterPath {
            posterURL = Env.baseURLImage.appendingPathComponent("/w500\(posterPath)")
        }

        var backdropURL: URL?
        if let backdropPath = backdropPath {
            backdropURL = Env.baseURLImage.appendingPathComponent("/w780\(backdropPath)")
        }

        return Show(
            id: id,
            type: .series(withNewEpisodes: withNewEpisodes),
            title: name,
            posterURL: posterURL,
            backdropURL: backdropURL,
            description: overview,
            releaseDate: DateTimeManager.yyyyMmDdToDate(firstAirDate),
            rating: Show.Rating(
                ratingAverage: voteAverage,
                ratingCount: voteCount
            )
        )
    }
}

extension Array<GetSeriesResponse> {
    func toDomain(withNewEpisodes: Bool) -> [Show] {
        self.map { getSeriesResponse in
            getSeriesResponse.toDomain(withNewEpisodes: withNewEpisodes)
        }
    }
}

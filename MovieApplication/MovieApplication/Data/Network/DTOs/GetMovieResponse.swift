//
//  GetMovieResponse.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

struct GetMovieResponse: Codable {

    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    func toDomain() -> Movie {
        Movie(
            id: id,
            title: title,
            releaseDate: DateTimeManager.yyyyMmDdToDate(releaseDate),
            description: overview,
            rating: voteAverage,
            reviewsCount: voteCount
        )
    }
}

extension Array<GetMovieResponse> {
    func toDomain() -> [Movie] {
        self.map { getMovieResponse in
            getMovieResponse.toDomain()
        }
    }
}

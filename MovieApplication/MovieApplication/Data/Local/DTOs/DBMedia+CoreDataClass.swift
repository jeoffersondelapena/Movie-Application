//
//  DBMedia+CoreDataClass.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//
//

import SwiftUI
import CoreData

@objc(DBMedia)
public class DBMedia: NSManagedObject {
    func toDomain() -> Media {
        Media(
            id: Int(id),
            type: type == 1
                ? .series(
                    withNewEpisodesThisMonth: withNewEpisodesThisMonth
                )
                : .movie,
            title: title ?? "",
            posterURL: posterURL,
            backdropURL: backdropURL,
            description: desc ?? "",
            releaseDate: releaseDate,
            rating: Media.Rating(
                ratingAverage: ratingAverage,
                ratingCount: Int(ratingCount)
            )
        )
    }
}

extension FetchedResults<DBMedia> {
    func toDomain() -> [Media] {
        map { dbMedia in
            dbMedia.toDomain()
        }
    }
}

extension Array<DBMedia> {
    func toDomain() -> [Media] {
        map { dbMedia in
            dbMedia.toDomain()
        }
    }
}

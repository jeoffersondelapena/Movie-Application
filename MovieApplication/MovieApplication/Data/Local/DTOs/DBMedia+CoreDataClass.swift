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
            title: title.orEmptyString(),
            posterURL: posterURL,
            backdropURL: backdropURL,
            description: desc.orEmptyString(),
            releaseDate: releaseDate,
            rating: Media.Rating(
                ratingAverage: ratingAverage,
                ratingCount: Int(ratingCount)
            )
        )
    }

    func isMatch(searchText: String) -> Bool {
        isTitleMatch(searchText: searchText) || isDescMatch(searchText: searchText)
    }

    private func isTitleMatch(searchText: String) -> Bool {
        guard let title = title else { return false }
        return title.localizedCaseInsensitiveContains(searchText)
    }

    private func isDescMatch(searchText: String) -> Bool {
        guard let desc = desc else { return false }
        return desc.localizedCaseInsensitiveContains(searchText)
    }
}

extension Array<DBMedia> {
    func toDomain() -> [Media] {
        map { dbMedia in
            dbMedia.toDomain()
        }
    }
}

extension Media {
    func toLocalDTO(managedObjectContext: NSManagedObjectContext) -> DBMedia {
        let dbMedia = DBMedia(context: managedObjectContext)

        dbMedia.id = Int64(id)
        dbMedia.type = Int64(type.key)

        switch type {
        case .series(let withNewEpisodesThisMonth):
            dbMedia.withNewEpisodesThisMonth = withNewEpisodesThisMonth
        default:
            dbMedia.withNewEpisodesThisMonth = false
        }

        dbMedia.title = title
        dbMedia.posterURL = posterURL
        dbMedia.backdropURL = backdropURL
        dbMedia.desc = description
        dbMedia.releaseDate = releaseDate
        dbMedia.ratingAverage = rating.ratingAverage
        dbMedia.ratingCount = Int64(rating.ratingCount)

        return dbMedia
    }
}

extension Array<Media> {
    func toLocalDTO(managedObjectContext: NSManagedObjectContext) -> [DBMedia] {
        map { media in
            media.toLocalDTO(managedObjectContext: managedObjectContext)
        }
    }
}

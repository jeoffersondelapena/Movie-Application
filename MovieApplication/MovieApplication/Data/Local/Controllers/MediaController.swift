//
//  MediaController.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import CoreData

extension DataController {
    func getDBMedias(
        context: NSManagedObjectContext,
        mediaType: MediaType
    ) -> [DBMedia] {
        var dbProducts: [DBMedia] = []

        do {
            let request = DBMedia.fetchRequest() as NSFetchRequest<DBMedia>
            request.predicate = NSPredicate(format: "type == %@", NSNumber(value: mediaType.key))
            dbProducts = try context.fetch(request)
        } catch {
            print("xyz3")
            ErrorManager.throwFatalError(error)
        }

        return dbProducts
    }

    func setDBMedias(
        context: NSManagedObjectContext,
        medias: [Media]
    ) {
        _ = medias.toLocalDTO(managedObjectContext: context)
        DataController.shared.save(context: context)
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

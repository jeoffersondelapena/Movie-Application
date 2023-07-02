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
        var dbMedias: [DBMedia] = []

        do {
            let request = DBMedia.fetchRequest() as NSFetchRequest<DBMedia>

            var subPredicates = [
                NSPredicate(
                    format: "type == %@",
                    NSNumber(value: mediaType.key)
                )
            ]

            switch mediaType {
            case .series(let withNewEpisodesThisMonth):
                subPredicates.append(
                    NSPredicate(
                        format: "withNewEpisodesThisMonth == %@",
                        NSNumber(value: withNewEpisodesThisMonth)
                    )
                )
            default:
                break
            }

            request.predicate = NSCompoundPredicate(
                type: .and,
                subpredicates: subPredicates
            )

            dbMedias = try context.fetch(request)
        } catch {
            ErrorManager.throwFatalError(error)
        }

        return dbMedias
    }

    func setDBMedias(
        context: NSManagedObjectContext,
        medias: [Media]
    ) {
        _ = medias.toLocalDTO(managedObjectContext: context)
        DataController.shared.save(context: context)
    }
}

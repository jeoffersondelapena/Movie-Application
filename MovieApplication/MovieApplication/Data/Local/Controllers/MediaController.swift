//
//  MediaController.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import CoreData

extension DataController {
    func getDBMedias(mediaType: MediaType) -> Result<[DBMedia], Error> {
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

        do {
            return .success(try context.fetch(request))
        } catch {
            return .failure(error)
        }
    }

    func setDBMedias(medias: [Media]) {
        _ = medias.toLocalDTO(managedObjectContext: context)
        save()
    }
}

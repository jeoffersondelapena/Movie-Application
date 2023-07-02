//
//  SearchController.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import CoreData

extension DataController {
    func searchDBMedias(
        context: NSManagedObjectContext,
        filterState: FilterState
    ) -> [DBMedia] {
        var dbMedias: [DBMedia] = []

        do {
            let request = DBMedia.fetchRequest() as NSFetchRequest<DBMedia>

            var mediaTypeKey: Int
            switch filterState.mediaType {
            case .movies:
                mediaTypeKey = MediaType.movie.key
            case .series:
                mediaTypeKey = MediaType.series().key
            }
            request.predicate = NSPredicate(
                format: "type == %@",
                NSNumber(value: mediaTypeKey)
            )

            dbMedias = try context.fetch(request)
        } catch {
            ErrorManager.throwFatalError(error)
        }

        return dbMedias.filter { dbMedia in
            guard let title = dbMedia.title else { return false }
            return title.lowercased()
                .contains(filterState.searchText.lowercased())
        }
    }
}

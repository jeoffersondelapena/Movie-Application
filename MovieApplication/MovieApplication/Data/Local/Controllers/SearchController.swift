//
//  SearchController.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import CoreData

extension DataController {
    func searchDBMedias(filterState: FilterState) -> Result<[DBMedia], Error> {
        var dbMedias: [DBMedia] = []

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

        do {
            dbMedias = try context.fetch(request)
        } catch {
            return .failure(error)
        }

        return .success(
            dbMedias.filter { dbMedia in
                dbMedia.isMatch(searchText: filterState.searchText)
            }
        )
    }
}

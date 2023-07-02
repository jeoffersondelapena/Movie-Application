//
//  DataController.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import CoreData

class DataController: ObservableObject {
    static let shared = DataController()

    let container = NSPersistentContainer(name: "Main")

    init() {
        container.loadPersistentStores { [weak self] _, error in
            guard let self = self else { return }
            self.container.viewContext.mergePolicy = NSMergePolicy(
                merge: NSMergePolicyType.mergeByPropertyObjectTrumpMergePolicyType
            )
            print("xyz1")
            ErrorManager.throwFatalError(error)
        }
    }

    func save(context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("xyz2")
                ErrorManager.throwFatalError(error)
            }
        }
    }
}

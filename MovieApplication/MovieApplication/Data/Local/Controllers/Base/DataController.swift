//
//  DataController.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import CoreData

class DataController: ObservableObject {
    static let shared = DataController()

    private let container = NSPersistentContainer(name: "Main")
    var context: NSManagedObjectContext {
        container.viewContext
    }

    private init() {
        container.loadPersistentStores { [weak self] _, error in
            guard let self = self else { return }
            self.context.mergePolicy = NSMergePolicy(
                merge: NSMergePolicyType.mergeByPropertyObjectTrumpMergePolicyType
            )
            ErrorManager.throwFatalError(error)
        }
    }

    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                ErrorManager.throwFatalError(error)
            }
        }
    }
}

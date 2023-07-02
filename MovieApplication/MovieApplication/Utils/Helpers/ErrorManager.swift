//
//  ErrorManager.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation

struct ErrorManager {
    static func throwFatalError(_ error: Error?) {
        if let error = error {
            fatalError("Unresolved Error: \(error.localizedDescription)")
        }
    }
}

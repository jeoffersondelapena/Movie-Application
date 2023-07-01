//
//  DataState.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation

struct DataState<T> {
    enum Overlay {
        case failure(error: Error)
        case progress
    }

    var data: T
    var overlay: Overlay?
}

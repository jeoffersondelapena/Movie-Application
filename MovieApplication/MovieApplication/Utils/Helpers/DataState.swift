//
//  DataState.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation

struct DataState<T> {
    var data: T
    var error: Error?
    var isLoading: Bool
}

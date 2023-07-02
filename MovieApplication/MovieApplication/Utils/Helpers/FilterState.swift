//
//  FilterState.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation

struct FilterState {
    enum MediaType {
        case movies
        case series
    }

    var searchText: String
    var mediaType: MediaType
}

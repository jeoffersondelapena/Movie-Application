//
//  MediaType.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import Foundation

enum MediaType: BinaryEquatable {
    case movie
    case series(withNewEpisodesThisMonth: Bool = false)
}

extension MediaType {
    var key: Int {
        switch self {
        case .movie:
            return 0
        case .series:
            return 1
        }
    }
}

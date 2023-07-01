//
//  ShowType.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import Foundation

enum ShowType: BinaryEquatable {
    case movie
    case series(withNewEpisodesThisMonth: Bool = false)
}

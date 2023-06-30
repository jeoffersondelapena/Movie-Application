//
//  MovieService.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

enum MovieService {
    case getMovies(year: Int)
}

extension MovieService: BaseTargetType, TargetType {
    var path: String {
        "/3/discover/movie"
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        switch self {
        case .getMovies(let year):
            return requestQueryParams(["primary_release_year": year])
        }
    }
}

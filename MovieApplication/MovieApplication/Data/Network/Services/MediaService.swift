//
//  MediaService.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

enum MediaService {
    case getMovies(year: Int)
    case getSeries(year: Int)
    case getSeriesWithNewEpisodes
}

extension MediaService: BaseTargetType, TargetType {
    var path: String {
        switch self {
        case .getMovies:
            return "/3/discover/movie"
        case .getSeries:
            return "/3/discover/tv"
        case .getSeriesWithNewEpisodes:
            return "/3/tv/on_the_air"
        }
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        switch self {
        case .getMovies(let year):
            return requestQueryParams(["primary_release_year": year])
        case .getSeries(let year):
            return requestQueryParams(["first_air_date_year": year])
        case .getSeriesWithNewEpisodes:
            return requestPlain()
        }
    }
}

extension MediaService: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        .reloadIgnoringLocalCacheData
    }
}

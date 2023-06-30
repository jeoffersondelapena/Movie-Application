//
//  SeriesService.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

enum SeriesService {
    case getSeries(year: Int)
    case getSeriesWithNewEpisodes
}

extension SeriesService: BaseTargetType, TargetType {
    var path: String {
        switch self {
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
        case .getSeries(let year):
            return requestQueryParams(["first_air_date_year": year])
        case .getSeriesWithNewEpisodes:
            return requestPlain()
        }
    }
}

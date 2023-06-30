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
}

extension SeriesService: BaseTargetType, TargetType {
    var path: String {
        "/3/discover/tv"
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        switch self {
        case .getSeries(let year):
            return requestQueryParams(["first_air_date_year": year])
        }
    }
}

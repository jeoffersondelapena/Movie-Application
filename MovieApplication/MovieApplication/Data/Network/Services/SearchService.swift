//
//  SearchService.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation
import Moya

enum SearchService {
    case searchMovies(searchText: String)
    case searchSeries(searchText: String)
}

extension SearchService: BaseTargetType, TargetType {
    var path: String {
        switch self {
        case .searchMovies:
            return "/3/search/movie"
        case .searchSeries:
            return "/3/search/tv"
        }
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        var query: String

        switch self {
        case .searchMovies(let searchText):
            query = searchText
        case .searchSeries(let searchText):
            query = searchText
        }

        return requestQueryParams(["query": query])
    }
}

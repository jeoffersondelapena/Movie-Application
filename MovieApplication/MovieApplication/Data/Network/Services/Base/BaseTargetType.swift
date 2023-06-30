//
//  BaseTargetType.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

protocol BaseTargetType {}

extension BaseTargetType {

    var baseURL: URL {
        Env.baseURL
    }

    var headers: [String: String]? {
        nil
    }

    func requestQueryParams(_ queryParams: [String: Any]) -> Moya.Task {
        var queryParamsWithAPIkey = queryParams
        queryParamsWithAPIkey["api_key"] = Env.apiKey
        return .requestParameters(
            parameters: queryParamsWithAPIkey,
            encoding: URLEncoding.queryString
        )
    }
}

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
    private var apiKeyQueryParam: [String: Any] {
        ["api_key": Env.apiKey]
    }

    var baseURL: URL {
        Env.baseURL
    }

    var headers: [String: String]? {
        nil
    }

    func requestPlain() -> Moya.Task {
        return .requestParameters(
            parameters: apiKeyQueryParam,
            encoding: URLEncoding.queryString
        )
    }

    func requestQueryParams(_ queryParams: [String: Any]) -> Moya.Task {
        return .requestParameters(
            parameters: queryParams.merging(apiKeyQueryParam) { queryParams, _ in
                queryParams
            },
            encoding: URLEncoding.queryString
        )
    }
}

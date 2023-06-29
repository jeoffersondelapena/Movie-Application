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
        URL(string: "https://api.themoviedb.org")!
    }

    var headers: [String: String]? {
        nil
    }

    func requestParameters(parameters: [String: Any]) -> Moya.Task {
        var parametersWithAPIkey = parameters
        parametersWithAPIkey["api_key"] = "c9e02e288ef86d6887098a8929d944ea"
        return .requestParameters(
            parameters: parametersWithAPIkey,
            encoding: URLEncoding.queryString
        )
    }
}

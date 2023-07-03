//
//  BaseRepository.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

class BaseRepository {
    func handleNetworkResult<T: Codable>(_ rawResult: Result<Response, MoyaError>) -> Result<[T], Error> {
        do {
            switch rawResult {
            case .success(let response):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                return .success((try jsonDecoder.decode(BaseResponse.self, from: response.data).results))
            case .failure(let error):
                return .failure(error)
            }
        } catch let error {
            return .failure(error)
        }
    }
}

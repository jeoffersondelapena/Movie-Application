//
//  MovieRepository.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

class MovieRepository: BaseRepository {
    private let provider: MoyaProvider<MovieService>

    init(provider: MoyaProvider<MovieService>) {
        self.provider = provider
    }

    func getMovies(year: Int, callback: @escaping (Result<[Movie], Error>) -> Void) {
        provider.request(.getMovies(year: year)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetMovieResponse], Error> = handleRawResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain()))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

//
//  WatchableRepository.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

class WatchableRepository: BaseRepository {
    private let movieProvider: MoyaProvider<MovieService>
    private let seriesProvider: MoyaProvider<SeriesService>

    init(
        movieProvider: MoyaProvider<MovieService>,
        seriesProvider: MoyaProvider<SeriesService>
    ) {
        self.movieProvider = movieProvider
        self.seriesProvider = seriesProvider
    }

    func getWatchables(
        watchableType: WatchableType,
        year: Int,
        callback: @escaping (Result<[Watchable], Error>) -> Void
    ) {
        switch watchableType {
        case .movie:
            getMovies(year: year, callback: callback)
        case .series:
            getSeries(year: year, callback: callback)
        }
    }

    private func getMovies(
        year: Int,
        callback: @escaping (Result<[Watchable], Error>) -> Void
    ) {
        movieProvider.request(.getMovies(year: year)) { [weak self] rawResult in
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

    private func getSeries(
        year: Int,
        callback: @escaping (Result<[Watchable], Error>) -> Void
    ) {
        seriesProvider.request(.getSeries(year: year)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleRawResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain()))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

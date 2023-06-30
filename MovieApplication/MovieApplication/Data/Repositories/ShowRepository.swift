//
//  ShowRepository.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

class ShowRepository: BaseRepository {
    private let movieProvider: MoyaProvider<MovieService>
    private let seriesProvider: MoyaProvider<SeriesService>

    init(
        movieProvider: MoyaProvider<MovieService>,
        seriesProvider: MoyaProvider<SeriesService>
    ) {
        self.movieProvider = movieProvider
        self.seriesProvider = seriesProvider
    }

    func getShows(
        showType: ShowType,
        year: Int,
        callback: @escaping (Result<[Show], Error>) -> Void
    ) {
        switch showType {
        case .movie:
            getMovies(year: year, callback: callback)
        case .series(let withNewEpisodes):
            if withNewEpisodes {
                getSeriesWithNewEpisodes(callback: callback)
            } else {
                getSeries(year: year, callback: callback)
            }
        }
    }

    private func getMovies(
        year: Int,
        callback: @escaping (Result<[Show], Error>) -> Void
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
        callback: @escaping (Result<[Show], Error>) -> Void
    ) {
        seriesProvider.request(.getSeries(year: year)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleRawResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain(withNewEpisodes: false)))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func getSeriesWithNewEpisodes(
        callback: @escaping (Result<[Show], Error>) -> Void
    ) {
        seriesProvider.request(.getSeriesWithNewEpisodes) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleRawResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain(withNewEpisodes: true)))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

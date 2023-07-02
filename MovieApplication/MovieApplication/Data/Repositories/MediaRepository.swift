//
//  MediaRepository.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

class MediaRepository: BaseRepository {
    private let provider: MoyaProvider<MediaService>

    init(provider: MoyaProvider<MediaService>) {
        self.provider = provider
    }

    func getMedias(
        mediaType: MediaType,
        year: Int,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        switch mediaType {
        case .movie:
            getMovies(year: year, callback: callback)
        case .series(let withNewEpisodesThisMonth):
            if withNewEpisodesThisMonth {
                getSeriesWithNewEpisodes(callback: callback)
            } else {
                getSeries(year: year, callback: callback)
            }
        }
    }

    private func getMovies(
        year: Int,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
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

    private func getSeries(
        year: Int,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.getSeries(year: year)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleRawResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain(withNewEpisodesThisMonth: false)))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func getSeriesWithNewEpisodes(
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.getSeriesWithNewEpisodes) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleRawResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain(withNewEpisodesThisMonth: true)))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

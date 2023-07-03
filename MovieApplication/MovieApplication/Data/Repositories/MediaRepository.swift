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
    private let controller: DataController

    init(
        provider: MoyaProvider<MediaService>,
        controller: DataController
    ) {
        self.provider = provider
        self.controller = controller
    }

    func getMedias(
        mediaType: MediaType,
        year: Int,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        switch NetworkStatusManager.shared.status {
        case .connected:
            switch mediaType {
            case .movie:
                getMoviesFromNetwork(year: year, callback: callback)
            case .series(let withNewEpisodesThisMonth):
                if withNewEpisodesThisMonth {
                    getSeriesWithNewEpisodesThisMonthFromNetwork(callback: callback)
                } else {
                    getSeriesFromNetwork(year: year, callback: callback)
                }
            }
        case .disconnected:
            switch controller.getDBMedias(mediaType: mediaType) {
            case .success(let response):
                callback(.success(response.toDomain()))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func getMoviesFromNetwork(
        year: Int,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.getMovies(year: year)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetMovieResponse], Error> = handleNetworkResult(rawResult)
            switch result {
            case .success(let response):
                let medias = response.toDomain()
                callback(.success(medias))
                cacheMedias(medias: medias)
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func getSeriesFromNetwork(
        year: Int,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.getSeries(year: year)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleNetworkResult(rawResult)
            switch result {
            case .success(let response):
                let medias = response.toDomain(withNewEpisodesThisMonth: false)
                callback(.success(medias))
                cacheMedias(medias: medias)
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func getSeriesWithNewEpisodesThisMonthFromNetwork(
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.getSeriesWithNewEpisodes) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleNetworkResult(rawResult)
            switch result {
            case .success(let response):
                let medias = response.toDomain(withNewEpisodesThisMonth: true)
                callback(.success(medias))
                cacheMedias(medias: medias)
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func cacheMedias(medias: [Media]) {
        controller.setDBMedias(medias: medias)
    }
}

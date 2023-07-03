//
//  SearchRepository.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation
import Moya

class SearchRepository: BaseRepository {
    private let provider: MoyaProvider<SearchService>
    private let controller: DataController

    init(
        provider: MoyaProvider<SearchService>,
        controller: DataController
    ) {
        self.provider = provider
        self.controller = controller
    }

    func searchMedias(
        filterState: FilterState,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        switch NetworkStatusManager.shared.status {
        case .connected:
            switch filterState.mediaType {
            case .movies:
                searchMoviesFromNetwork(searchText: filterState.searchText, callback: callback)
            case .series:
                searchSeriesFromNetwork(searchText: filterState.searchText, callback: callback)
            }
        case .disconnected:
            switch controller.searchDBMedias(filterState: filterState) {
            case .success(let response):
                callback(.success(response.toDomain()))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func searchMoviesFromNetwork(
        searchText: String,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.searchMovies(searchText: searchText)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetMovieResponse], Error> = handleNetworkResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain()))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }

    private func searchSeriesFromNetwork(
        searchText: String,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.searchSeries(searchText: searchText)) { [weak self] rawResult in
            guard let self = self else { return }
            let result: Result<[GetSeriesResponse], Error> = handleNetworkResult(rawResult)
            switch result {
            case .success(let response):
                callback(.success(response.toDomain(withNewEpisodesThisMonth: false)))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

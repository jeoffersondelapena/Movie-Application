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

    init(provider: MoyaProvider<SearchService>) {
        self.provider = provider
    }

    func searchMedias(
        filterState: FilterState,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        switch filterState.mediaType {
        case .movies:
            searchMovies(searchText: filterState.searchText, callback: callback)
        case .series:
            searchSeries(searchText: filterState.searchText, callback: callback)
        }
    }

    private func searchMovies(
        searchText: String,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.searchMovies(searchText: searchText)) { [weak self] rawResult in
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

    private func searchSeries(
        searchText: String,
        callback: @escaping (Result<[Media], Error>) -> Void
    ) {
        provider.request(.searchSeries(searchText: searchText)) { [weak self] rawResult in
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
}

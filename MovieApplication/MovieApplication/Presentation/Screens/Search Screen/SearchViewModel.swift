//
//  SearchViewModel.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var mediasDataState: DataState<[Media]> = DataState(
        data: [],
        isLoading: true
    )

    @Published var filterState = FilterState(
        searchText: "",
        mediaType: .movies
    )

    private let repository: SearchRepository

    init(repository: SearchRepository) {
        self.repository = repository
    }

    func searchMedias(searchText: String) {
        filterState.searchText = searchText
        searchMedias()
    }

    func searchMedias(mediaType: FilterState.MediaType) {
        filterState.mediaType = mediaType
        searchMedias()
    }

    private func searchMedias() {
        mediasDataState.isLoading = true
        repository.searchMedias(
            filterState: filterState
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                mediasDataState.error = nil
                mediasDataState.data = response
            case .failure(let error):
                mediasDataState.data.removeAll()
                mediasDataState.error = error
            }
            mediasDataState.isLoading = false
        }
    }
}

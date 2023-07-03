//
//  MediaListViewModel.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

class MediaListViewModel: ObservableObject {
    @Published var mediasDataState: DataState<[Media]> = DataState(
        data: [],
        isLoading: false
    )

    private let repository: MediaRepository

    init(repository: MediaRepository) {
        self.repository = repository
    }

    func getMedias(mediaType: MediaType) {
        mediasDataState.isLoading = true
        repository.getMedias(
            mediaType: mediaType,
            year: 2023
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

//
//  MediaListViewModel.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

class MediaListViewModel: ObservableObject {
    @Published var medias: [Media] = []

    @Published var errorMessage: String?

    private let repository: MediaRepository

    init(repository: MediaRepository) {
        self.repository = repository
    }

    func getMedias(mediaType: MediaType) {
        repository.getMedias(
            mediaType: mediaType,
            year: 2023
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                medias = response
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}

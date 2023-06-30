//
//  WatchableListViewModel.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

class WatchableListViewModel: ObservableObject {
    @Published var watchables: [Watchable] = []

    @Published var errorMessage: String?

    private let repository: WatchableRepository

    init(repository: WatchableRepository) {
        self.repository = repository
    }

    func getWatchables(watchableType: WatchableType) {
        repository.getWatchables(watchableType: watchableType, year: 2023) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                watchables = response
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}

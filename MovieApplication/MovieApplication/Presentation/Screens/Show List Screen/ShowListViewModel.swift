//
//  ShowListViewModel.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation

class ShowListViewModel: ObservableObject {
    @Published var shows: [Show] = []

    @Published var errorMessage: String?

    private let repository: ShowRepository

    init(repository: ShowRepository) {
        self.repository = repository
    }

    func getShows(showType: ShowType) {
        repository.getShows(
            showType: showType,
            year: 2023
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                shows = response
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}

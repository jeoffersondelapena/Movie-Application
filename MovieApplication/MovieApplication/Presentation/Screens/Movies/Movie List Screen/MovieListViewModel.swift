//
//  MovieListViewModel.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import Foundation
import Moya

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    @Published var errorMessage: String?

    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func getMovies() {
        repository.getMovies(year: 2023) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                movies = response
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}

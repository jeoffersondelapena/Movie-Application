//
//  MovieListScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI
import Moya

struct MovieListScreen: View {

    @StateObject private var viewModel = MovieListViewModel(
        repository: MovieRepository(
            provider: MoyaProvider<MovieService>()
        )
    )

    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
            ForEach(viewModel.movies) { movie in
                Text(movie.title)
            }
        }
        .onAppear(perform: fetchContents)
    }

    private func fetchContents() {
        viewModel.getMovies()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}

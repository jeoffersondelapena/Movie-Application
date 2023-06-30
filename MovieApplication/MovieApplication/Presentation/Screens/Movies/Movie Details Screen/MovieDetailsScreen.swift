//
//  MovieDetailsScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct MovieDetailsScreen: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            Text(movie.title)
                .applyCustomFont()
        }
        .navigationTitle(L10n.Title.movieDetails)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen(movie: Movie.sample)
    }
}

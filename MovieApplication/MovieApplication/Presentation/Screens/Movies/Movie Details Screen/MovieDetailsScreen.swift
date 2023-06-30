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
            VStack {
                if let posterURL = movie.posterURL {
                    ImageHandler(
                        url: posterURL,
                        width: .infinity
                    )
                    .symmetricPadding(horizontal: 32)
                }

                Text(movie.title)
                    .applyCustomFont(weight: .w700, size: 24)
                    .alignText(.center)

                HStack {
                    RatingView(rating: movie.rating)

                    Spacer()

                    if let releaseDate = movie.releaseDate {
                        Text(DateTimeManager.dateToMmmmDdYyyy(releaseDate))
                            .applyCustomFont(weight: .w300, color: .gray)
                    }
                }

                Text(movie.description)
                    .applyCustomFont()

                if let backdropURL = movie.backdropURL {
                    ImageHandler(
                        url: backdropURL,
                        width: .infinity
                    )
                }
            }
            .padding(16)
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

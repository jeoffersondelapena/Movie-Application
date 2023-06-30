//
//  MovieItem.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct MovieItem: View {
    let movie: Movie

    var body: some View {
        NavigationLink(destination: MovieDetailsScreen(movie: movie)) {
            HStack {
                ImageHandler(
                    url: movie.posterURL,
                    width: 150,
                    height: 225
                )

                VStack(alignment: .leading) {
                    Text(movie.title)
                        .applyCustomFont(weight: .w700, size: 16)
                        .alignText(.leading)

                    if let releaseDate = movie.releaseDate {
                        Text(DateTimeManager.dateToMmmmDdYyyy(releaseDate))
                            .applyCustomFont(weight: .w300, color: .gray)
                    }

                    RatingView(rating: movie.rating)

                    Text(movie.description)
                        .applyCustomFont()
                        .alignText(.leading)
                        .lineLimit(3)
                }
            }
            .padding()
        }
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(movie: Movie.sample)
    }
}

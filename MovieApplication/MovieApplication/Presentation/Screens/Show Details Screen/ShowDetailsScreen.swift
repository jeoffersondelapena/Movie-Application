//
//  ShowDetailsScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct ShowDetailsScreen: View {
    var navigationBarTitle: String {
        switch showType {
        case .movie:
            return L10n.Title.movieDetails
        case .series(let withNewEpisodesThisMonth):
            if withNewEpisodesThisMonth {
                return L10n.Title.showDetails
            } else {
                return L10n.Title.seriesDetails
            }
        }
    }

    let showType: ShowType
    let show: Show

    var body: some View {
        ScrollView {
            VStack {
                if let posterURL = show.posterURL {
                    ImageHandler(
                        url: posterURL,
                        width: .infinity
                    )
                    .symmetricPadding(horizontal: 32)
                }

                Text(show.title)
                    .applyCustomFont(weight: .w700, size: 24)
                    .alignText(.center)

                HStack {
                    RatingView(rating: show.rating)

                    Spacer()

                    if let releaseDate = show.releaseDate {
                        ReleaseDateView(releaseDate: releaseDate)
                    }
                }

                Text(show.description)
                    .applyCustomFont(size: 14)

                if let backdropURL = show.backdropURL {
                    ImageHandler(
                        url: backdropURL,
                        width: .infinity
                    )
                }
            }
            .padding(16)
        }
        .navigationTitle(navigationBarTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShowDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailsScreen(
            showType: .movie,
            show: Show.sample
        )
    }
}

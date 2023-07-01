//
//  MediaDetailsScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct MediaDetailsScreen: View {
    var navigationBarTitle: String {
        switch mediaType {
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

    let mediaType: MediaType
    let media: Media

    var body: some View {
        ScrollView {
            VStack {
                if let posterURL = media.posterURL {
                    ImageHandler(
                        url: posterURL,
                        width: .infinity
                    )
                    .symmetricPadding(horizontal: 32)
                }

                Text(media.title)
                    .applyCustomFont(weight: .w700, size: 24)
                    .alignText(.center)

                HStack {
                    RatingView(rating: media.rating)

                    Spacer()

                    if let releaseDate = media.releaseDate {
                        ReleaseDateView(releaseDate: releaseDate)
                    }
                }

                Text(media.description)
                    .applyCustomFont(size: 14)

                if let backdropURL = media.backdropURL {
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

struct MediaDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsScreen(
            mediaType: .movie,
            media: Media.sample
        )
    }
}

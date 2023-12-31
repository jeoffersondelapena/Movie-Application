//
//  MediaDetailsScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct MediaDetailsScreen: View {
    var navigationBarTitle: String {
        switch media.type {
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

    let media: Media

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                if let posterURL = media.posterURL {
                    CacheableImageView(
                        url: posterURL,
                        width: .infinity
                    )
                    .symmetricPadding(horizontal: 32)
                }

                Text(media.title)
                    .applyCustomFont(
                        weight: .w700,
                        size: 24,
                        color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                    )
                    .alignText(.center)

                HStack(spacing: 8) {
                    RatingView(rating: media.rating)

                    Spacer()

                    if let releaseDate = media.releaseDate {
                        ReleaseDateView(releaseDate: releaseDate)
                    }
                }

                Text(media.description)
                    .applyCustomFont(weight: .w300, size: 14)

                if let backdropURL = media.backdropURL {
                    CacheableImageView(
                        url: backdropURL,
                        width: .infinity
                    )
                }
            }
            .padding(16)
        }
        .navigationBarTitle(navigationBarTitle)
        .toolbar {
            ToolbarMenuView()
        }
    }
}

struct MediaDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsScreen(media: Media.sample)
    }
}

//
//  MediaDetailsScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct MediaDetailsScreen: View {
    @AppStorage("isDarkMode") private var isDarkMode = true

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

    private var toolbar: some View {
        Menu(
            content: {
                Toggle(isOn: $isDarkMode) {
                    Label(L10n.Label.darkMode, systemImage: "moon")
                }

                NavigationLink(destination: SearchScreen()) {
                    Label(L10n.Label.search, systemImage: "magnifyingglass")
                }
            },
            label: {
                Image(systemName: "ellipsis")
            }
        )
    }

    let media: Media

    var body: some View {
        ScrollView {
            VStack {
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

                HStack {
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
        .navigationBarTitle(navigationBarTitle, displayMode: .inline)
        .toolbar {
            toolbar
        }
    }
}

struct MediaDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailsScreen(media: Media.sample)
    }
}

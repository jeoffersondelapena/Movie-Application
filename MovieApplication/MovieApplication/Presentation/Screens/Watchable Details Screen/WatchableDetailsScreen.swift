//
//  WatchableDetailsScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct WatchableDetailsScreen: View {
    let watchableType: WatchableType
    let watchable: Watchable

    private var title: String {
        switch watchableType {
        case .movie:
            return L10n.Title.movieDetails
        case .series:
            return L10n.Title.seriesDetails
        }
    }

    var body: some View {
        ScrollView {
            VStack {
                if let posterURL = watchable.posterURL {
                    ImageHandler(
                        url: posterURL,
                        width: .infinity
                    )
                    .symmetricPadding(horizontal: 32)
                }

                Text(watchable.title)
                    .applyCustomFont(weight: .w700, size: 24)
                    .alignText(.center)

                HStack {
                    RatingView(rating: watchable.rating)

                    Spacer()

                    if let releaseDate = watchable.releaseDate {
                        Text(DateTimeManager.dateToMmmmDdYyyy(releaseDate))
                            .applyCustomFont(weight: .w300, color: .gray)
                    }
                }

                Text(watchable.description)
                    .applyCustomFont()

                if let backdropURL = watchable.backdropURL {
                    ImageHandler(
                        url: backdropURL,
                        width: .infinity
                    )
                }
            }
            .padding(16)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WatchableDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        WatchableDetailsScreen(
            watchableType: .movie,
            watchable: Watchable.sample
        )
    }
}

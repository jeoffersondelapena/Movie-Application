//
//  WatchableItem.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct WatchableItem: View {
    let watchableType: WatchableType
    let watchable: Watchable

    var body: some View {
        NavigationLink(
            destination: WatchableDetailsScreen(
                watchableType: watchableType,
                watchable: watchable
            )
        ) {
            HStack {
                if let posterURL = watchable.posterURL {
                    ImageHandler(
                        url: posterURL,
                        width: 150,
                        height: 225
                    )
                }

                VStack(alignment: .leading) {
                    Text(watchable.title)
                        .applyCustomFont(weight: .w700, size: 18)
                        .alignText(.leading)

                    if let releaseDate = watchable.releaseDate {
                        Text(DateTimeManager.dateToMmmmDdYyyy(releaseDate))
                            .applyCustomFont(weight: .w300, color: .gray)
                    }

                    RatingView(rating: watchable.rating)

                    Text(watchable.description)
                        .applyCustomFont()
                        .alignText(.leading)
                        .lineLimit(3)
                }
            }
            .padding()
        }
    }
}

struct WatchableItem_Previews: PreviewProvider {
    static var previews: some View {
        WatchableItem(watchableType: .movie, watchable: Watchable.sample)
    }
}

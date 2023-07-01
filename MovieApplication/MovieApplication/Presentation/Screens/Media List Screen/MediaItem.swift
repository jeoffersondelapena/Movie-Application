//
//  MediaItem.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct MediaItem: View {
    let media: Media

    var body: some View {
        NavigationLink(
            destination: MediaDetailsScreen(media: media)
        ) {
            HStack {
                if let posterURL = media.posterURL {
                    ImageHandler(
                        url: posterURL,
                        width: 100,
                        height: 150
                    )
                }

                VStack(alignment: .leading) {
                    Text(media.title)
                        .applyCustomFont(
                            weight: .w700,
                            size: 14,
                            color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                        )
                        .alignText(.leading)

                    if let releaseDate = media.releaseDate {
                        ReleaseDateView(releaseDate: releaseDate)
                    }

                    RatingView(rating: media.rating)

                    Text(media.description)
                        .applyCustomFont(weight: .w300)
                        .alignText(.leading)
                        .lineLimit(3)
                }
            }
        }
    }
}

struct MediaItem_Previews: PreviewProvider {
    static var previews: some View {
        MediaItem(media: Media.sample)
    }
}

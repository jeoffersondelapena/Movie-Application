//
//  ShowItem.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct ShowItem: View {
    let showType: ShowType
    let show: Show

    var body: some View {
        NavigationLink(
            destination: ShowDetailsScreen(
                showType: showType,
                show: show
            )
        ) {
            HStack {
                if let posterURL = show.posterURL {
                    ImageHandler(
                        url: posterURL,
                        width: 100,
                        height: 150
                    )
                }

                VStack(alignment: .leading) {
                    Text(show.title)
                        .applyCustomFont(weight: .w700, size: 14)
                        .alignText(.leading)

                    if let releaseDate = show.releaseDate {
                        ReleaseDateView(releaseDate: releaseDate)
                    }

                    RatingView(rating: show.rating)

                    Text(show.description)
                        .applyCustomFont()
                        .alignText(.leading)
                        .lineLimit(3)
                }
            }
        }
    }
}

struct ShowItem_Previews: PreviewProvider {
    static var previews: some View {
        ShowItem(showType: .movie, show: Show.sample)
    }
}

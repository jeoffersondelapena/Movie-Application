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
        HStack {
            ImageHandler(
                url: movie.posterURL,
                width: 200,
                height: 300
            )

            VStack {
                Text(movie.title)
                    .bold()

                Text(movie.description)
                    .lineLimit(3)
            }
        }
        .padding()
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(movie: Movie.sample)
    }
}

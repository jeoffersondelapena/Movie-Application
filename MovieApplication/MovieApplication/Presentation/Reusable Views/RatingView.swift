//
//  RatingView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct RatingView: View {
    let rating: Movie.Rating

    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .size(24)

            Text(rating.toString())
                .applyCustomFont()
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: Movie.Rating.sample)
    }
}

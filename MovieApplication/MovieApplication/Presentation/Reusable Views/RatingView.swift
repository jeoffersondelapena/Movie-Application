//
//  RatingView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct RatingView: View {
    let rating: Media.Rating

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "star.fill")
                .foregroundColor(
                    Asset.ColorAssets.secondaryAccentColor.swiftUIColor
                )
                .iconSize(16)

            Text(rating.toString())
                .applyCustomFont(
                    size: 14,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: Media.Rating.sample)
    }
}

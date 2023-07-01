//
//  ReleaseDateView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct ReleaseDateView: View {
    let releaseDate: Date

    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundColor(
                    Asset.ColorAssets.secondaryAccentColor.swiftUIColor
                )
                .iconSize(16)

            Text(DateTimeManager.dateToMmmmDdYyyy(releaseDate))
                .applyCustomFont(
                    size: 14,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )
        }
    }
}

struct ReleaseDateView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseDateView(releaseDate: Date())
    }
}

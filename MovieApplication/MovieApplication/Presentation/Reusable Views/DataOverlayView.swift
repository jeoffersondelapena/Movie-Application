//
//  DataOverlayView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import SwiftUI

struct DataOverlayView: View {
    let imageSystemName: String
    let title: String
    let message: String

    init(
        imageSystemName: String = "xmark.square.fill",
        title: String = L10n.Title.somethingWentWrong,
        message: String = L10n.Message.tryAgainlater
    ) {
        self.imageSystemName = imageSystemName
        self.title = title
        self.message = message
    }

    var body: some View {
        VStack {
            Image(systemName: imageSystemName)
                .iconSize(24)
                .foregroundColor(Asset.ColorAssets.highEmphasisForeground.swiftUIColor)

            Text(title)
                .applyCustomFont(
                    weight: .w700,
                    size: 14,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )

            Text(message)
                .applyCustomFont()
        }
        .maxSize()
        .background(Color(.systemBackground))
    }
}

struct DataOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        DataOverlayView()
    }
}

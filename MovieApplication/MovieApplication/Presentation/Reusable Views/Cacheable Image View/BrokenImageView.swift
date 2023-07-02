//
//  BrokenImageView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct BrokenImageView: View {
    private let width: CGFloat?
    private let height: CGFloat?

    init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }

    var body: some View {
        ZStack {
            Asset.ColorAssets.disabledForeground.swiftUIColor
                .size(width: width, height: height)

            Image(systemName: "photo")
                .foregroundColor(
                    Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )
                .iconSize(16)
        }
    }
}

struct BrokenImageView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenImageView()
    }
}

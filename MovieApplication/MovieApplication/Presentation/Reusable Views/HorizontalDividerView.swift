//
//  HorizontalDividerView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct HorizontalDividerView: View {
    private let color: Color

    init(color: Color = Asset.ColorAssets.highEmphasisForeground.swiftUIColor) {
        self.color = color
    }

    var body: some View {
        color
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
}

struct HorizontalDividerView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDividerView()
    }
}

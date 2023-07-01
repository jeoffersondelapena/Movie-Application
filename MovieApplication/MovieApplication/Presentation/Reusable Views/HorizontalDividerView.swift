//
//  HorizontalDividerView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct HorizontalDividerView: View {
    var body: some View {
        Asset.ColorAssets.highEmphasisForeground.swiftUIColor
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
}

struct HorizontalDividerView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDividerView()
    }
}

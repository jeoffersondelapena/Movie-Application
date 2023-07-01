//
//  HorizontalDivider.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct HorizontalDivider: View {
    var body: some View {
        Asset.ColorAssets.highEmphasisForeground.swiftUIColor
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
}

struct HorizontalDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDivider()
    }
}

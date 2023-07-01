//
//  SubNavigationBar.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

extension View {
    func showSubNavigationBar(title: String) -> some View {
        showAtTheTop(view: SubNavigationBar(title: title))
    }
}

private struct SubNavigationBar: View {
    let title: String

    var body: some View {
        VStack(spacing: 8) {
            HorizontalDividerView()

            Text(title)
                .applyCustomFont(
                    weight: .w700,
                    size: 14,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )

            HorizontalDividerView()
        }
    }
}

struct SubNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        SubNavigationBar(title: L10n.Sample.title)
    }
}

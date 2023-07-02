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
    @StateObject private var networkStatusManager = NetworkStatusManager()

    let title: String

    var body: some View {
        HStack {
            Text(title)
                .applyCustomFont(
                    weight: .w700,
                    size: 14,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )

            if networkStatusManager.status == .disconnected {
                Spacer()

                Text("No Internet")
                    .applyCustomFont(
                        weight: .w700,
                        size: 14,
                        color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                    )
            }
        }
        .padding(8)
        .addHorizontalBorders(
            color: Asset.ColorAssets.disabledForeground.swiftUIColor
        )
    }
}

struct SubNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        SubNavigationBar(title: L10n.Sample.title)
    }
}

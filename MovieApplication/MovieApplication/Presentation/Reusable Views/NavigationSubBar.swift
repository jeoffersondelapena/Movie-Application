//
//  NavigationSubBar.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

extension View {
    func showNavigationSubBar(title: String) -> some View {
        showAtTheTop(view: NavigationSubBar(title: title))
    }
}

private struct NavigationSubBar: View {
    @EnvironmentObject private var networkStatusManager: NetworkStatusManager

    let title: String

    var body: some View {
        HStack {
            Text(title)
                .applyCustomFont(
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )
                .alignText(
                    networkStatusManager.isDisconnected()
                        ? .leading
                        : .center
                )

            if networkStatusManager.isDisconnected() {
                Spacer()

                Text(L10n.Label.offlineMode)
                    .applyCustomFont(
                        weight: .w700,
                        color: Asset.ColorAssets.secondaryAccentColor.swiftUIColor
                    )
            }
        }
        .symmetricPadding(horizontal: 8, vertical: 4)
        .addHorizontalBorders(
            color: Asset.ColorAssets.disabledForeground.swiftUIColor
        )
    }
}

struct NavigationSubBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSubBar(title: L10n.Sample.title)
    }
}

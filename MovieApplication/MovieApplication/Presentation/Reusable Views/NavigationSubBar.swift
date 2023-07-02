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
                    weight: .w700,
                    size: 14,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )

            if networkStatusManager.status == .disconnected {
                Spacer()

                Text("Offline Mode")
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

struct NavigationSubBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSubBar(title: L10n.Sample.title)
    }
}

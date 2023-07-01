//
//  NavigationBar.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

extension View {
    func showNavigationBar() -> some View {
        showAtTheTop(view: NavigationBar())
    }
}

private struct NavigationBar: View {
    var body: some View {
        HStack {
            Text(L10n.Title.movieApp)
                .applyCustomFont(
                    weight: .w700,
                    size: 16,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )

            Spacer()

            DarkModeToggleView()

            NavigationLink(destination: SearchScreen()) {
                Image(systemName: "magnifyingglass")
                    .iconSize(24)
                    .foregroundColor(.accentColor)
            }
        }
        .padding(16)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}

//
//  NavigationBar.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

extension View {
    func showNavigationBar(
        title: String = L10n.Title.movieApp,
        onBackTap: (() -> Void)? = nil,
        onSearchTap: @escaping () -> Void
    ) -> some View {
        showAtTheTop(
            view: NavigationBar(
                title: title,
                onBackTap: onBackTap,
                onSearchTap: onSearchTap
            )
        )
    }
}

private struct NavigationBar: View {
    private let title: String
    private let onBackTap: (() -> Void)?
    private let onSearchTap: () -> Void

    init(
        title: String,
        onBackTap: (() -> Void)?,
        onSearchTap: @escaping () -> Void
    ) {
        self.title = title
        self.onBackTap = onBackTap
        self.onSearchTap = onSearchTap
    }

    var body: some View {
        HStack {
            if let onBackTap = onBackTap {
                Image(systemName: "chevron.backward")
                    .iconSize(32)
                    .foregroundColor(.accentColor)
                    .onTapGesture(perform: onBackTap)

                Spacer()
            }

            Text(title)
                .applyCustomFont(
                    weight: .w700,
                    size: 16,
                    color: Asset.ColorAssets.highEmphasisForeground.swiftUIColor
                )

            Spacer()

            DarkModeToggleView()

            NavigationLink(destination: SearchScreen()) {
                Image(systemName: "magnifyingglass.circle.fill")
                    .iconSize(32)
                    .foregroundColor(.accentColor)
//                    .onTapGesture(perform: onSearchTap)
            }
        }
        .symmetricPadding(horizontal: 32, vertical: 16)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: L10n.Title.loremIpsum, onBackTap: nil) {}
    }
}

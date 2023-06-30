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
        Text(L10n.Title.movieApp)
            .applyCustomFont(weight: .w700, size: 16)
            .alignText(.leading)
            .symmetricPadding(horizontal: 32, vertical: 16)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}

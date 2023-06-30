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
        Text(title)
            .applyCustomFont(weight: .w700, size: 14)
            .alignText(.center)
            .padding(4)
            .background(Color.accentColor)
    }
}

struct SubNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        SubNavigationBar(title: L10n.Title.loremIpsum)
    }
}

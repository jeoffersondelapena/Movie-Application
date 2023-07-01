//
//  ToolbarMenuView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import SwiftUI

struct ToolbarMenuView: View {
    @AppStorage("isDarkMode") private var isDarkMode = true

    private let withSearchOption: Bool

    init(withSearchOption: Bool = true) {
        self.withSearchOption = withSearchOption
    }
    
    var body: some View {
        Menu(
            content: {
                Toggle(isOn: $isDarkMode) {
                    Label(L10n.Label.darkMode, systemImage: "moon")
                }

                if withSearchOption {
                    NavigationLink(destination: SearchScreen()) {
                        Label(L10n.Label.search, systemImage: "magnifyingglass")
                    }
                }
            },
            label: {
                Image(systemName: "ellipsis")
            }
        )
    }
}

struct ToolbarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarMenuView()
    }
}

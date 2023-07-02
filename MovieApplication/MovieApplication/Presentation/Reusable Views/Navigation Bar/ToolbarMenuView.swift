//
//  ToolbarMenuView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import SwiftUI

struct ToolbarMenuView: View {
    @AppStorage("isDarkMode") private var isDarkMode = true

    private var darkModeToggleView: some View {
        Toggle(isOn: $isDarkMode) {
            Label(L10n.Action.darkMode, systemImage: "moon")
        }
    }

    private let withSearchOption: Bool

    init(withSearchOption: Bool = true) {
        self.withSearchOption = withSearchOption
    }

    var body: some View {
        if !withSearchOption {
            darkModeToggleView

        } else {
            Menu(
                content: {
                    darkModeToggleView

                    NavigationLink(destination: SearchScreen()) {
                        Label(L10n.Action.search, systemImage: "magnifyingglass")
                    }
                },
                label: {
                    Image(systemName: "ellipsis")
                }
            )
        }
    }
}

struct ToolbarMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarMenuView()
    }
}

//
//  SearchScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct SearchScreen: View {
    @FocusState private var isFocused: Bool

    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField(L10n.Placeholder.whatAreYouLookingFor, text: $searchText)
                .focused($isFocused)
                .padding(8)
                .addHorizontalBorders(
                    color: Asset.ColorAssets.disabledForeground.swiftUIColor
                )

            List {
                Text(searchText)

                Text(searchText)
            }
        }
        .navigationBarTitle(L10n.Title.search)
        .toolbar {
            ToolbarMenuView(withSearchOption: false)
        }
        .onAppear(perform: focusOnTextField)
    }

    private func focusOnTextField() {
        isFocused = true
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

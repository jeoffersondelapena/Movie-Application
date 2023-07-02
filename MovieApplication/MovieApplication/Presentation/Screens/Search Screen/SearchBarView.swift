//
//  SearchBarView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject private var textDebounceManager = TextDebounceManager()

    @FocusState private var isFocused: Bool

    private var clearButtonIcon: some View {
        Image(systemName: "xmark.circle.fill")
            .opacity(textDebounceManager.searchText.isEmpty ? 0 : 1)
    }

    let onTextDebounce: (String) -> Void

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField(
                    L10n.Placeholder.whatAreYouLookingFor,
                    text: $textDebounceManager.searchText
                )
                .focused($isFocused)
                .foregroundColor(.primary)

                Button(
                    action: clearSearchBar,
                    label: {
                        clearButtonIcon
                    }
                )
            }
            .symmetricPadding(horizontal: 6, vertical: 8)
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
        }
        .padding(.horizontal)
        .onAppear(perform: focusOnTextField)
        .onReceive(textDebounceManager.$debouncedText, perform: onTextDebounce)
    }

    private func focusOnTextField() {
        isFocused = true
    }

    private func clearSearchBar() {
        textDebounceManager.searchText = ""
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView { _ in }
    }
}

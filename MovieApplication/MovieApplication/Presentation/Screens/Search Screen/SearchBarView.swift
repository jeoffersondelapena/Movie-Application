//
//  SearchBarView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject private var textDebounceManager = TextDebounceManager()

    @State private var showCancelButton: Bool = false
    @FocusState private var isFocused: Bool

    let onTextDebounce: (String) -> Void

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                TextField(
                    "search",
                    text: $textDebounceManager.searchText,
                    onEditingChanged: { _ in
                        showCancelButton = true
                    },
                    onCommit: {
                        print("onCommit")
                    }
                )
                .focused($isFocused)
                .foregroundColor(.primary)

                Button(
                    action: {
                        textDebounceManager.searchText = ""
                    },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(textDebounceManager.searchText.isEmpty ? 0 : 1)
                    }
                )
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)

            if showCancelButton {
                Button("Cancel") {
                    UIApplication.shared.endEditing(true)
                    textDebounceManager.searchText = ""
                    showCancelButton = false
                }
                .foregroundColor(.accentColor)
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton)
        .onAppear(perform: focusOnTextField)
        .onReceive(textDebounceManager.$debouncedText, perform: onTextDebounce)
    }

    private func focusOnTextField() {
        isFocused = true
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView { _ in }
    }
}

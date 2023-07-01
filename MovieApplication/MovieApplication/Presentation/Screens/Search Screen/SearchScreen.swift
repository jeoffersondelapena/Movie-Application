//
//  SearchScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject private var viewModel = SearchViewModel()

    @FocusState private var isFocused: Bool
    @State private var showCancelButton: Bool = false

    @StateObject private var textDebounceManager = TextDebounceManager()

    private var searchBarView: some View {
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
                ).foregroundColor(.primary)

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
    }

    private var searchBarView2: some View {
        TextField(L10n.Placeholder.whatAreYouLookingFor, text: $textDebounceManager.searchText)
            .padding(8)
            .addHorizontalBorders(
                color: Asset.ColorAssets.disabledForeground.swiftUIColor
            )
    }

    var body: some View {
        VStack {
            searchBarView
                .focused($isFocused)
        }
        .navigationBarTitle(L10n.Title.search)
        .toolbar {
            ToolbarMenuView(withSearchOption: false)
        }
        .onAppear(perform: focusOnTextField)
        .onReceive(textDebounceManager.$debouncedText, perform: searchMedias)
    }

    private func focusOnTextField() {
        isFocused = true
    }

    private func searchMedias(searchText: String) {
        viewModel.searchMedias(searchText: searchText)
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.endEditing(true)
    }

    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

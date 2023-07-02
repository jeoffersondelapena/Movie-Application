//
//  DarkModeToggleView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct DarkModeToggleView: View {
    @AppStorage("isDarkMode") private var isDarkMode = true

    var body: some View {
        Image(systemName: isDarkMode ? "moon" : "sun.max")
            .iconSize(24)
            .foregroundColor(.accentColor)
            .onTapGesture(perform: toggleDarkMode)
    }

    private func toggleDarkMode() {
        isDarkMode.toggle()
    }
}

struct DarkModeToggleView_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeToggleView()
    }
}

//
//  MovieApplicationApp.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/29/23.
//

import SwiftUI

@main
struct MovieApplicationApp: App {
    @StateObject private var networkStatusManager = NetworkStatusManager.shared
    @AppStorage("isDarkMode") private var isDarkMode = true

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(networkStatusManager)
        }
    }
}

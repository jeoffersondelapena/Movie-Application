//
//  ContentView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    var body: some View {
        TabView {
            NavigationStack {
                MediaListScreen(mediaType: .movie)
            }
            .tabItem {
                Label(
                    L10n.Action.movies,
                    systemImage: "film.fill"
                )
            }

            NavigationStack {
                MediaListScreen(mediaType: .series())
            }
            .tabItem {
                Label(
                    L10n.Action.series,
                    systemImage: "tv.fill"
                )
            }

            NavigationStack {
                MediaListScreen(mediaType: .series(withNewEpisodesThisMonth: true))
            }
            .tabItem {
                Label(
                    L10n.Action.episodes,
                    systemImage: "play.square.stack.fill"
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(
                \.managedObjectContext,
                 DataController.shared.container.viewContext
            )
            .environmentObject(NetworkStatusManager.shared)
    }
}

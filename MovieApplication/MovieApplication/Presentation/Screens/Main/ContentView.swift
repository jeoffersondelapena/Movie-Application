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
                ShowListScreen(showType: .movie)
            }
            .tabItem {
                Label(
                    L10n.Label.movies,
                    systemImage: "film.fill"
                )
            }

            NavigationStack {
                ShowListScreen(showType: .series())
            }
            .tabItem {
                Label(
                    L10n.Label.series,
                    systemImage: "tv.fill"
                )
            }

            NavigationStack {
                ShowListScreen(showType: .series(withNewEpisodesThisMonth: true))
            }
            .tabItem {
                Label(
                    L10n.Label.episodes,
                    systemImage: "play.square.stack.fill"
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

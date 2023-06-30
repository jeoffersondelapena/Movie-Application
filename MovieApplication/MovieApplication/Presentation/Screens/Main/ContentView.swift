//
//  ContentView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                WatchableListScreen(watchableType: .movie)
            }
            .tabItem {
                Label(
                    L10n.Label.movies,
                    systemImage: "film.fill"
                )
            }

            NavigationStack {
                WatchableListScreen(watchableType: .series)
            }
            .tabItem {
                Label(
                    L10n.Label.series,
                    systemImage: "tv.fill"
                )
            }

            Text(L10n.Label.episodes)
                .applyCustomFont()
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

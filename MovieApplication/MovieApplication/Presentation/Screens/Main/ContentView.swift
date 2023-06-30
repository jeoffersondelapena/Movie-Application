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
            MovieListScreen()
                .tabItem {
                    Label("Movies", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

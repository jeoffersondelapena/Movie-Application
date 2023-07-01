//
//  SearchScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            Text(searchText)
        }
        .navigationBarTitle(L10n.Title.search, displayMode: .inline)
        .searchable(text: $searchText)
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

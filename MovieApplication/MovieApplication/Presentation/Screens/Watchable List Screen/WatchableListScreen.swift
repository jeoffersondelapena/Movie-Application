//
//  WatchableListScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI
import Moya

struct WatchableListScreen: View {
    @StateObject private var viewModel = WatchableListViewModel(
        repository: WatchableRepository(
            movieProvider: MoyaProvider<MovieService>(),
            seriesProvider: MoyaProvider<SeriesService>()
        )
    )

    let watchableType: WatchableType

    private var title: String {
        switch watchableType {
        case .movie:
            return L10n.Title.movies
        case .series:
            return L10n.Title.series
        }
    }

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.watchables) { watchable in
                    WatchableItem(
                        watchableType: watchableType,
                        watchable: watchable
                    )
                }
            }
        }
        .navigationTitle(title)
        .onAppear(perform: fetchContents)
    }

    private func fetchContents() {
        viewModel.getWatchables(watchableType: watchableType)
    }
}

struct WatchableListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WatchableListScreen(watchableType: .movie)
    }
}

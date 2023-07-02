//
//  MediaListScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI
import Moya

struct MediaListScreen: View {
    @StateObject private var viewModel = MediaListViewModel(
        repository: MediaRepository(
            provider: MoyaProvider<MediaService>()
        )
    )

    private var subNavigationBarTitle: String {
        switch mediaType {
        case .movie:
            return L10n.Title.movies2023
        case .series(let withNewEpisodesThisMonth):
            if withNewEpisodesThisMonth {
                return L10n.Title.withNewEpisodesThisMonth
            } else {
                return L10n.Title.series2023
            }
        }
    }

    let mediaType: MediaType

    var body: some View {
        MediaListView(mediasDataState: viewModel.mediasDataState)
            .showSubNavigationBar(title: subNavigationBarTitle)
            .showNavigationBar()
            .onAppear(perform: fetchContents)
    }

    private func fetchContents() {
        viewModel.getMedias(mediaType: mediaType)
    }
}

struct MediaListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MediaListScreen(mediaType: .movie)
    }
}

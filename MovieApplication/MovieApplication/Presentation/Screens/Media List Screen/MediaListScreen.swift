//
//  MediaListScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI
import Moya

struct MediaListScreen: View {
    @EnvironmentObject private var networkStatusManager: NetworkStatusManager

    @Environment(\.managedObjectContext) var managedObjectContext

    @StateObject private var viewModel = MediaListViewModel(
        repository: MediaRepository(
            provider: MoyaProvider<MediaService>(plugins: [CachePolicyCustomPlugin()])
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
            .showNavigationSubBar(title: subNavigationBarTitle)
            .showNavigationBar()
            .onAppear(perform: fetchContents)
            .onChange(of: networkStatusManager.status) { _ in
                onNetworkStatusChange()
            }
    }

    private func fetchContents() {
        switch networkStatusManager.status {
        case .connected:
            fetchContentsFromNetwork()
        case .disconnected:
            fetchContentsFromCache()
        }
    }

    private func fetchContentsFromNetwork() {
        viewModel.getMedias(
            mediaType: mediaType,
            callback: cacheContents
        )
    }

    private func fetchContentsFromCache() {
        viewModel.mediasDataState.error = nil
        viewModel.mediasDataState.data = DataController.shared.getDBMedias(
            context: managedObjectContext,
            mediaType: mediaType
        )
        .toDomain()
    }

    private func cacheContents(medias: [Media]) {
        if !medias.isEmpty {
            DataController.shared.setDBMedias(
                context: managedObjectContext,
                medias: medias
            )
        }
    }

    private func onNetworkStatusChange() {
        viewModel.mediasDataState = DataState(
            data: [],
            isLoading: false
        )
        fetchContents()
    }
}

struct MediaListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MediaListScreen(mediaType: .movie)
    }
}

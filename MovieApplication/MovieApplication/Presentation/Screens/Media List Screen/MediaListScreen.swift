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
    @FetchRequest(sortDescriptors: []) var dbObjects: FetchedResults<DBMedia>

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
            .onChange(
                of: viewModel.mediasDataState.data,
                perform: cacheContents
            )
            .onChange(
                of: networkStatusManager.status,
                perform: fetchContents
            )
    }

    private func fetchContents() {
        viewModel.getMedias(mediaType: mediaType)
    }

    private func fetchContents(networkStatus: NetworkStatus) {
        viewModel.mediasDataState.error = nil
        viewModel.mediasDataState.data = []
        switch networkStatus {
        case .connected:
            viewModel.getMedias(mediaType: mediaType)
        case .disconnected:
            viewModel.mediasDataState.data = DataController.shared.getDBMedias(
                context: managedObjectContext,
                mediaType: mediaType
            )
            .toDomain()
        }
    }

    private func cacheContents(medias: [Media]) {
        if !medias.isEmpty {
            DataController.shared.setDBMedias(
                context: managedObjectContext,
                medias: medias
            )
        }
    }
}

struct MediaListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MediaListScreen(mediaType: .movie)
    }
}

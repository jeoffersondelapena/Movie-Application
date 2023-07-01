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
            movieProvider: MoyaProvider<MovieService>(),
            seriesProvider: MoyaProvider<SeriesService>()
        )
    )

    @State private var isShowingErrorAlert = false
    @State private var errorMessage: String?

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

    private var errorAlert: Alert {
        Alert(
            title: Text(L10n.Title.somethingWentWrong),
            message: Text(errorMessage ?? L10n.Message.tryAgainlater),
            dismissButton: .default(Text(L10n.Action.ok)) {
                dismissErrorAlert()
            }
        )
    }

    let mediaType: MediaType

    var body: some View {
        MediaListView(medias: viewModel.medias)
            .showSubNavigationBar(title: subNavigationBarTitle)
            .showNavigationBar()
            .onAppear(perform: fetchContents)
            .alert(isPresented: $isShowingErrorAlert) {
                errorAlert
            }
            .onChange(of: viewModel.errorMessage, perform: onErrorMessageChange)
    }

    private func fetchContents() {
        viewModel.getMedias(mediaType: mediaType)
    }

    private func onErrorMessageChange(errorMessage: String?) {
        if let errorMessage = errorMessage {
            showErrorAlert(errorMessage: errorMessage)
        } else {
            dismissErrorAlert()
        }
    }

    private func showErrorAlert(errorMessage: String) {
        isShowingErrorAlert = true
        self.errorMessage = errorMessage
    }

    private func dismissErrorAlert() {
        isShowingErrorAlert = false
        self.errorMessage = nil
    }
}

struct MediaListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MediaListScreen(mediaType: .movie)
    }
}

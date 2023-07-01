//
//  ShowListScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI
import Moya

struct ShowListScreen: View {
    @StateObject private var viewModel = ShowListViewModel(
        repository: ShowRepository(
            movieProvider: MoyaProvider<MovieService>(),
            seriesProvider: MoyaProvider<SeriesService>()
        )
    )

    @State private var isShowingErrorAlert = false
    @State private var errorMessage: String?

    private var subNavigationBarTitle: String {
        switch showType {
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

    private var isInset: Bool {
        switch showType {
        case .movie:
            return false
        case .series(let withNewEpisodesThisMonth):
            return !withNewEpisodesThisMonth
        }
    }

    let showType: ShowType

    var body: some View {
        List {
            ForEach(viewModel.shows) { show in
                ShowItem(
                    showType: showType,
                    show: show
                )
            }
        }
        .dynamicListStyle(isInset: isInset)
        .showSubNavigationBar(title: subNavigationBarTitle)
        .showNavigationBar()
        .alert(isPresented: $isShowingErrorAlert) {
            Alert(
                title: Text(L10n.Title.somethingWentWrong),
                message: Text(errorMessage ?? L10n.Message.tryAgainlater),
                dismissButton: .default(Text(L10n.Action.ok)) {
                    dismissErrorAlert()
                }
            )
        }
        .onAppear(perform: fetchContents)
        .onChange(of: viewModel.errorMessage, perform: onErrorMessageChange)
    }

    private func fetchContents() {
        viewModel.getShows(showType: showType)
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

struct ShowListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShowListScreen(showType: .movie)
    }
}

//
//  SearchScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI
import Moya

struct SearchScreen: View {
    @EnvironmentObject private var networkStatusManager: NetworkStatusManager

    @Environment(\.managedObjectContext) var managedObjectContext

    @StateObject private var viewModel = SearchViewModel(
        repository: SearchRepository(
            provider: MoyaProvider<SearchService>()
        )
    )

    var body: some View {
        VStack {
            SearchBarView(onTextDebounce: searchMedias)

            MediaTypePickerView(onMediaTypeChange: searchMedias)

            MediaListView(
                mediasDataState: viewModel.mediasDataState,
                filterState: viewModel.filterState,
                isGrouped: false
            )
        }
        .navigationBarTitle(L10n.Title.search)
        .toolbar {
            ToolbarMenuView(withSearchOption: false)
        }
        .onChange(of: networkStatusManager.status) { _ in
            onNetworkStatusChange()
        }
    }

    private func searchMedias(searchText: String) {
        viewModel.filterState.searchText = searchText
        searchMedias()
    }

    private func searchMedias(mediaType: FilterState.MediaType) {
        viewModel.filterState.mediaType = mediaType
        searchMedias()
    }

    private func searchMedias() {
        switch networkStatusManager.status {
        case .connected:
            viewModel.searchMedias()
        case .disconnected:
            searchMediasFromCache()
        }
    }

    private func searchMediasFromCache() {
        viewModel.mediasDataState.error = nil
        viewModel.mediasDataState.data = DataController.shared.searchDBMedias(
            context: managedObjectContext,
            filterState: viewModel.filterState
        )
        .toDomain()
    }

    private func onNetworkStatusChange() {
        viewModel.mediasDataState = DataState(
            data: [],
            isLoading: false
        )
        searchMedias()
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

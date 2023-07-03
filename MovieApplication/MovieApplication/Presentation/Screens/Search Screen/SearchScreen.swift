//
//  SearchScreen.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI
import Moya

struct SearchScreen: View {
    @StateObject private var viewModel = SearchViewModel(
        repository: SearchRepository(
            provider: MoyaProvider<SearchService>(plugins: [CachePolicyCustomPlugin()]),
            controller: DataController.shared
        )
    )

    var body: some View {
        VStack(spacing: 8) {
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
    }

    private func searchMedias(searchText: String) {
        viewModel.filterState.searchText = searchText
        viewModel.searchMedias()
    }

    private func searchMedias(mediaType: FilterState.MediaType) {
        viewModel.filterState.mediaType = mediaType
        viewModel.searchMedias()
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

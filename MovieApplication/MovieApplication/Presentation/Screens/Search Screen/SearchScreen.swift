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
            provider: MoyaProvider<SearchService>()
        )
    )

    var body: some View {
        VStack {
            SearchBarView(onTextDebounce: viewModel.searchMedias)

            MediaTypePickerView(onMediaTypeChange: viewModel.searchMedias)

            MediaListView(
                mediasDataState: viewModel.mediasDataState,
                isGrouped: false
            )
        }
        .navigationBarTitle(L10n.Title.search)
        .toolbar {
            ToolbarMenuView(withSearchOption: false)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

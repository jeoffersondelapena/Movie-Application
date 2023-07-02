//
//  MediaListView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct MediaListView: View {
    private let mediasDataState: DataState<[Media]>
    private let filterState: FilterState?
    private let isGrouped: Bool

    init(
        mediasDataState: DataState<[Media]>,
        filterState: FilterState? = nil,
        isGrouped: Bool = true
    ) {
        self.mediasDataState = mediasDataState
        self.filterState = filterState
        self.isGrouped = isGrouped
    }

    var body: some View {
        ZStack {
            VStack {
                if mediasDataState.isLoading {
                    ProgressView()
                        .padding()
                }

                List(mediasDataState.data) { media in
                    MediaItem(media: media)
                }
                .dynamicListStyle(isGrouped: isGrouped)
            }

            if !mediasDataState.isLoading {
                if let error = mediasDataState.error {
                    DataOverlayView(
                        message: error.localizedDescription
                    )

                } else if mediasDataState.data.isEmpty {
                    if let filterState = filterState, filterState.searchText.isEmpty {
                        DataOverlayView(
                            imageSystemName: "magnifyingglass.circle.fill",
                            title: L10n.Title.startSearching,
                            message: L10n.Message.typeKeywords
                        )

                    } else {
                        DataOverlayView(
                            imageSystemName: "questionmark.square.fill",
                            title: L10n.Title.noResults,
                            message: L10n.Message.tryOtherKeywords
                        )
                    }
                }
            }
        }
    }
}

struct MediaListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListView(
            mediasDataState: DataState(
                data: [
                    Media.sample,
                    Media.sample
                ],
                isLoading: false
            )
        )
    }
}

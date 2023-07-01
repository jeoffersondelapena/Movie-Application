//
//  MediaListView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct MediaListView: View {
    private let mediasDataState: DataState<[Media]>
    private let isGrouped: Bool

    init(mediasDataState: DataState<[Media]>, isGrouped: Bool = true) {
        self.mediasDataState = mediasDataState
        self.isGrouped = isGrouped
    }

    var body: some View {
        ZStack {
            List {
                ForEach(mediasDataState.data) { media in
                    MediaItem(media: media)
                }
            }
            .dynamicListStyle(isGrouped: isGrouped)

            if let overlay = mediasDataState.overlay {
                switch overlay {
                case .failure(let error):
                    DataOverlayView(
                        title: L10n.Title.noResults,
                        message: error.localizedDescription
                    )

                case .progress:
                    ProgressView()
                }

            } else if mediasDataState.data.isEmpty {
                DataOverlayView(
                    title: L10n.Title.noResults,
                    message: L10n.Message.tryOtherKeywords
                )
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
                overlay: nil
            )
        )
    }
}

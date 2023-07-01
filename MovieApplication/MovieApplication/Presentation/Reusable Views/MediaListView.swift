//
//  MediaListView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct MediaListView: View {
    private let medias: [Media]
    private let isGrouped: Bool

    init(medias: [Media], isGrouped: Bool = true) {
        self.medias = medias
        self.isGrouped = isGrouped
    }

    var body: some View {
        List {
            ForEach(medias) { media in
                MediaItem(media: media)
            }
        }
        .dynamicListStyle(isGrouped: isGrouped)
    }
}

struct MediaListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaListView(medias: [
            Media.sample,
            Media.sample
        ])
    }
}

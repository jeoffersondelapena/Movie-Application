//
//  MediaTypePickerView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import SwiftUI

struct MediaTypePickerView: View {
    @State private var mediaType: FilterState.MediaType = .movies

    let onMediaTypeChange: (FilterState.MediaType) -> Void

    var body: some View {
        Picker(L10n.Accessibility.filterBy, selection: $mediaType) {
            Text(L10n.Action.movies)
                .tag(FilterState.MediaType.movies)

            Text(L10n.Action.series)
                .tag(FilterState.MediaType.series)
        }
        .pickerStyle(.segmented)
        .onChange(of: mediaType, perform: onMediaTypeChange)
    }
}

struct MediaTypePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MediaTypePickerView { _ in }
    }
}

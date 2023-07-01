//
//  DataOverlayView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import SwiftUI

struct DataOverlayView: View {
    let title: String
    let message: String

    init(
        title: String = L10n.Title.somethingWentWrong,
        message: String = L10n.Message.tryAgainlater
    ) {
        self.title = title
        self.message = message
    }

    var body: some View {
        VStack {
            Text(title)

            Text(message)
        }
    }
}

struct DataOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        DataOverlayView()
    }
}

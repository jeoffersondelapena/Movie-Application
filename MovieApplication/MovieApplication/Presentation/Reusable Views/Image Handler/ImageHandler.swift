//
//  ImageHandler.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct ImageHandler: View {
    let url: URL?
    let width: CGFloat?
    let height: CGFloat?

    init(url: URL?, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.url = url
        self.width = width
        self.height = height
    }

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .size(width: width, height: height)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .size(width: width, height: height)
            case .failure:
                ImageHandlerFailedPlaceholder(
                    width: width,
                    height: height
                )
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct ImageHandler_Previews: PreviewProvider {
    static var previews: some View {
        ImageHandler(url: nil)
    }
}

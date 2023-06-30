//
//  ImageHandlerFailedPlaceholder.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

struct ImageHandlerFailedPlaceholder: View {
    let width: CGFloat?
    let height: CGFloat?

    init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }

    var body: some View {
        ZStack {
            Color(uiColor: Asset.ColorAssets.d3D3D3.color)
                .size(width: width, height: height)

            Image(systemName: "photo")
        }
    }
}

struct ImageHandlerFailedPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        ImageHandlerFailedPlaceholder()
    }
}

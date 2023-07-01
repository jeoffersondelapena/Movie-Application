//
//  CacheableImageView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI
import Kingfisher

struct CacheableImageView: View {
    private let url: URL
    private let width: CGFloat?
    private let height: CGFloat?

    init(url: URL, width: CGFloat? = nil, height: CGFloat? = nil) {
        self.url = url
        self.width = width
        self.height = height
    }

    var body: some View {
        KFImage(url)
            .placeholder {
                ProgressView()
                    .size(width: width, height: height)
            }
            .cancelOnDisappear(true)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .size(width: width, height: height)
    }
}

struct CacheableImageView_Previews: PreviewProvider {
    static var previews: some View {
        CacheableImageView(url: URL(string: L10n.Sample.url)!)
    }
}

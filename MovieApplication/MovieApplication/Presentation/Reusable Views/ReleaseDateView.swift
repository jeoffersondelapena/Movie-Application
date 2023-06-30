//
//  ReleaseDateView.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

struct ReleaseDateView: View {
    let releaseDate: Date

    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundColor(.accentColor)
                .size(24)

            Text(DateTimeManager.dateToMmmmDdYyyy(releaseDate))
                .applyCustomFont(weight: .w300)
        }
    }
}

struct ReleaseDateView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseDateView(releaseDate: Date())
    }
}

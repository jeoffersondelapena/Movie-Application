//
//  Text+Extensions.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

enum FontWeight {
    case w300
    case w400
    case w500
    case w600
    case w700
}

extension Text {
    func alignText(_ textAlignment: TextAlignment) -> some View {
        let alignment: Alignment

        switch textAlignment {
        case .leading:
            alignment = .leading
        case .center:
            alignment = .center
        case .trailing:
            alignment = .trailing
        }

        return self
            .frame(maxWidth: .infinity, alignment: alignment)
            .multilineTextAlignment(textAlignment)
    }

    func applyCustomFont(
        weight: FontWeight = .w400,
        size: CGFloat = 12,
        color: Color = .white
    ) -> Text {
        let fontConvertible: FontConvertible

        let poppins = FontFamily.Poppins.self
        switch weight {
        case .w300:
            fontConvertible = poppins.light
        case .w400:
            fontConvertible = poppins.regular
        case .w500:
            fontConvertible = poppins.medium
        case .w600:
            fontConvertible = poppins.semiBold
        case .w700:
            fontConvertible = poppins.bold
        }
        return self
            .font(SwiftUI.Font(fontConvertible.font(size: size)))
            .foregroundColor(color)
    }
}

//
//  DynamicListStyleModifier.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

extension View {
    func dynamicListStyle(isInset: Bool) -> some View {
        modifier(DynamicListStyleModifier(isInset: isInset))
    }
}

struct DynamicListStyleModifier: ViewModifier {
    let isInset: Bool

    func body(content: Content) -> some View {
        if isInset {
            content.listStyle(.insetGrouped)
        } else {
            content.listStyle(.grouped)
        }
    }
}

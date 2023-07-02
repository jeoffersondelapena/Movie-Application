//
//  DynamicListStyleModifier.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import SwiftUI

extension View {
    func dynamicListStyle(isGrouped: Bool) -> some View {
        modifier(DynamicListStyleModifier(isGrouped: isGrouped))
    }
}

private struct DynamicListStyleModifier: ViewModifier {
    let isGrouped: Bool

    func body(content: Content) -> some View {
        if isGrouped {
            content
        } else {
            content.listStyle(.plain)
        }
    }
}

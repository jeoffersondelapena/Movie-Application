//
//  View+Extensions.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 6/30/23.
//

import SwiftUI

extension View {
    func symmetricPadding(
        horizontal: CGFloat? = nil,
        vertical: CGFloat? = nil
    ) -> some View {
        var view: any View = self

        if let horizontal = horizontal {
            view = view.padding([.leading, .trailing], horizontal)
        }
        if let vertical = vertical {
            view = view.padding([.top, .bottom], vertical)
        }

        return AnyView(view)
    }

    func paddingAt(
        leading: CGFloat? = nil,
        top: CGFloat? = nil,
        trailing: CGFloat? = nil,
        bottom: CGFloat? = nil
    ) -> some View {
        var view: any View = self

        if let leading = leading {
            view = view.padding(.leading, leading)
        }
        if let top = top {
            view = view.padding(.top, top)
        }
        if let trailing = trailing {
            view = view.padding(.trailing, trailing)
        }
        if let bottom = bottom {
            view = view.padding(.bottom, bottom)
        }

        return AnyView(view)
    }

    func size(_ value: CGFloat) -> some View {
        return AnyView(
            self.frame(width: value, height: value)
        )
    }

    func size(width: CGFloat?, height: CGFloat?) -> some View {
        var view: any View = self

        if width == .infinity || height == .infinity {
            view = self.frame(maxWidth: width, maxHeight: height)
        } else {
            view = self.frame(width: width, height: height)
        }

        return AnyView(view)
    }

    func showAtTheTop(view: some View) -> some View {
        VStack(spacing: 0) {
            view
            self.frame(maxHeight: .infinity)
        }
    }

    func iconSize(_ value: CGFloat) -> some View {
        self.font(.system(size: value))
    }
}

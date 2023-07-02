//
//  UIApplication+Extensions.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/2/23.
//

import UIKit

extension UIApplication {
    func endEditing(_ force: Bool) {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
            .windows
            .first?
            .endEditing(force)
    }
}

//
//  String+Extensions.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/3/23.
//

import Foundation

extension Optional<String> {
    func orEmptyString() -> String {
        self ?? ""
    }
}

//
//  BinaryEquatable.swift
//  MovieApplication
//
//  Created by Jeofferson Dela Peña on 7/1/23.
//

import Foundation

protocol BinaryEquatable: Equatable {}

extension BinaryEquatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        withUnsafeBytes(of: lhs) { lhsBytes -> Bool in
            withUnsafeBytes(of: rhs) { rhsBytes -> Bool in
                lhsBytes.elementsEqual(rhsBytes)
            }
        }
    }
}


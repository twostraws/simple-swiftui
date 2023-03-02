//
//  Date-RawRepresentable.swift
//  SimpleNotes
//
//  Created by Paul Hudson on 02/03/2023.
//

import Foundation

/// A tiny extension to make dates supported in `@AppStorage`. This ought to be built-in to be honest,
/// so please file feedback with Apple asking for a native solution!
extension Date: RawRepresentable {
    public var rawValue: Int {
        Int(self.timeIntervalSinceReferenceDate)
    }

    public init?(rawValue: Int) {
        self = Date(timeIntervalSinceReferenceDate: Double(rawValue))
    }
}

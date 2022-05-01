//
// ContentView.swift
// SimpleScores
//
// Copyright © 2022 Paul Hudson.
// Licensed under MIT license.
//
// https://github.com/twostraws/simple-swiftui
// See LICENSE for license information
//

import Foundation

/// Describes the color choices available to the user.
/// All cases here have a matching color in the asset catalog.
enum ColorChoice: String, Codable, CaseIterable {
    case blue, gray, green, indigo, orange, purple, red, teal
}

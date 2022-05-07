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

/// One score in the user's game.
struct Score: Codable, Identifiable, Hashable {
    /// A unique, random identifier for this item.
    var id = UUID()

    /// The name of the player this score is attached to.
    var playerName = String(localized: "New Player", comment: "Default New Player Name")

    /// The player's current score.
    var score = 0

    /// The named color to use for this player's background.
    /// See ColorChoice.swift and the asset catalog for more information.
    var color = ColorChoice.blue
}

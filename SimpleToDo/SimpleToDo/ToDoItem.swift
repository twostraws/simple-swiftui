//
// ContentView.swift
// SimpleToDo
//
// Copyright © 2022 Paul Hudson.
// Licensed under MIT license.
//
// https://github.com/twostraws/simple-swiftui
// See LICENSE for license information
//

import Foundation

/// One item in our to do list.
struct ToDoItem: Codable, Identifiable, Hashable {
    /// The priority for a single item; uses `CaseIterable` so we loop over all three cases in `DetailView`.
    enum Priority: String, Codable, CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }

    /// A unique, random identifier for this item.
    var id = UUID()

    /// The user-facing title of this item.
    var title = "New Item"

    /// The current priority for this item.
    var priority = Priority.medium

    /// Whether this item has been completed or not.
    var isComplete = false

    /// The SF Symbol icon name to use for this item.
    var icon: String {
        if isComplete {
            return "checkmark.square"
        } else {
            switch priority {
            case .low:
                return "arrow.down.square"
            case .medium:
                return "square"
            default:
                return "exclamationmark.square"
            }
        }
    }

    /// The value of the item, to convey this information to assistive technologies.
    var accessibilityValue: String {
        if isComplete {
            return "completed"
        } else {
            switch priority {
            case .low:
                return "low priority"
            case .medium:
                return "" // To prevent verbosity, don't set a specific value for the default priority.
            case .high:
                return "high priority"
            }
        }
    }
}

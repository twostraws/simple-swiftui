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

import Combine
import Foundation

/// A shared class that loads, saves, and manipulates an array of to do items.
class ViewModel: ObservableObject {
    /// The array of items our app is working with.
    @Published var items: [Score]

    /// A URL to where the JSON for our data should be loaded and saved.
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedItems")

    /// An active Combine chain that watches for changes to the `items` array, and calls save()
    /// 5 seconds after a change has happened.
    private var saveSubscription: AnyCancellable?

    /// An empty initializer that loads our data from disk.
    init() {
        do {
            // Attempt to load saved data for this app.
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([Score].self, from: data)
        } catch {
            // Loading failed, so start with an empty array.
            items = []
        }

        // Wait 5 seconds after `items` has changed before calling `save()`, to
        // avoid repeatedly calling it for every tiny change.
        saveSubscription = $items
            .debounce(for: 5, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.save()
            }
    }

    /// Converts our items to JSON, then saves it to disk.
    func save() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }

    /// Adds one new item to the array.
    func add() {
        let usedColors = items.map(\.color)
        let color = ColorChoice.allCases.first { usedColors.contains($0) == false } ?? .blue
        let newItem = Score(color: color)
        items.append(newItem)
    }

    /// Deletes several items from the array; used with onDelete() in `ContentView` to
    /// enable swipe to delete.
    /// - Parameter offsets: The `IndexSet` of items we should be deleting.
    func delete(_ offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    /// Deletes all items from the array, leaving none behind.
    func deleteAll() {
        items.removeAll()
    }

    /// Sets all scores in the array back to 0, but leaves the player names intact.
    func reset() {
        for item in 0..<items.count {
            items[item].score = 0
        }
    }
}

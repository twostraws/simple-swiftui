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

import SwiftUI

/// Displays a single item from the list in `ContentView`.
struct ItemRow: View {
    /// A live binding to the item we're trying to show. This comes direct from our view model.
    @Binding var item: ToDoItem

    var body: some View {
        NavigationLink {
            DetailView(item: $item)
        } label: {
            Label(item.title, systemImage: item.icon)
                .animation(nil, value: item)
        }
        .tag(item)
        .accessibilityValue(item.accessibilityValue)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: .constant(.example))
    }
}

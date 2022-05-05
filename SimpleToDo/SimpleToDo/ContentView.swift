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

/// The main listing view for the app, showing all to do items for the user to select from.
struct ContentView: View {
    /// The shared view model.
    @ObservedObject var model: ViewModel

    /// All the items that are currently selected in the list.
    @State private var selectedItems = Set<ToDoItem>()

    /// Whether editing is currently active or not. We use this rather than the
    /// Environment edit mode because it creates simpler code.
    @State private var editMode = EditMode.inactive

    var body: some View {
        List(selection: $selectedItems) {
            ForEach($model.items, content: ItemRow.init)
                .onDelete(perform: model.delete)
        }
        .navigationTitle("SimpleToDo")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
                    .disabled(model.items.isEmpty)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: model.add) {
                    Label("Add Item", systemImage: "plus")
                }
            }

            /// When we're in editing mode we add a toolbar button to let the user
            /// delete all selected items at once.
            ToolbarItem(placement: .bottomBar) {
                if editMode == .active {
                    HStack {
                        Spacer()

                        Button(role: .destructive) {
                            model.delete(selectedItems)
                            selectedItems.removeAll()
                            editMode = .inactive
                        } label: {
                            Label("Delete selected", systemImage: "trash")
                        }
                        .disabled(selectedItems.isEmpty)
                    }
                }
            }
        }
        .animation(.default, value: model.items)
        .listStyle(.sidebar)
        .environment(\.editMode, $editMode)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ViewModel())
    }
}

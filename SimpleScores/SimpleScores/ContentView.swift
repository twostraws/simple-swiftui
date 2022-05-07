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

import SwiftUI

/// The main listing view for the app, showing all scores the user has configured.
struct ContentView: View {
    /// The shared view model.
    @ObservedObject var model: ViewModel

    /// Whether we are prompting the user to confirm deleting all players.
    @State private var showingClearAlert = false

    var body: some View {
        List {
            ForEach($model.items, content: ScoreRow.init)
                .onDelete(perform: model.delete)

            // This button adds new players, and is automatically disabled
            // once we run out of player colors to use.
            Button(action: model.add) {
                Label("Add Player", systemImage: "plus")
                    .font(.title.bold())
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .contentShape(Rectangle())
            }
            .disabled(model.items.count == ColorChoice.allCases.count)
            .listRowSeparator(.hidden)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: model.reset) {
                    Label("Reset Scores to 0", systemImage: "arrow.counterclockwise")
                }
                .disabled(model.items.isEmpty)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingClearAlert = true
                } label: {
                    Label("Remove All", systemImage: "trash")
                }
                .disabled(model.items.isEmpty)
            }
        }
        .alert("Delete all players?", isPresented: $showingClearAlert) {
            Button("Delete", role: .destructive, action: model.deleteAll)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This will immediately remove all players and their scores.")
        }
        .animation(.default, value: model.items)
        .navigationTitle("SimpleScores")
        .listStyle(.plain) // let our rows run almost edge to edge
        .buttonStyle(.plain) // disable the gray selection flash for our rows
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ContentView(model: ViewModel())
            }
            NavigationView {
                ContentView(model: ViewModel())
            }
            .preferredColorScheme(.dark)
            .environment(\.locale, Locale(identifier: "es"))
        }
    }
}

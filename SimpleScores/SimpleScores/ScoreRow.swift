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

/// Displays a single item from the list in `ContentView`.
struct ScoreRow: View {
    /// A live binding to the score data we're trying to show. This comes direct from our view model.
    @Binding var item: Score

    var body: some View {
        HStack(spacing: 10) {
            Button {
                item.score -= 1
            } label: {
                // An image with a 44x44 tappable area, for easier use.
                Image(systemName: "minus")
                    .font(.title3.weight(.black))
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }

            // Make the player name expand to fill available horizontal space.
            TextField("Player name", text: $item.playerName)
                .font(.title.weight(.black))
                .minimumScaleFactor(0.75)
                .frame(maxWidth: .infinity, alignment: .leading)
                .submitLabel(.done)

            Text(String(item.score))
                .font(.title.weight(.black))

            Button {
                item.score += 1
            } label: {
                // An image with a 44x44 tappable area, for easier use.
                Image(systemName: "plus")
                    .font(.title3.weight(.black))
                    .frame(minWidth: 44, minHeight: 44)
                    .contentShape(Rectangle())
            }
        }
        .padding(10)
        .animation(nil, value: item)
        .background(Color(item.color.rawValue))
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .cornerRadius(10)
        .accessibilityElement() // Make the whole row selectable as one
        .accessibilityLabel(item.playerName)
        .accessibilityValue(String(item.score))
        .accessibilityHint("Activate to rename this player.")
        .accessibilityAddTraits(.isButton)
        .accessibilityAdjustableAction { direction in
            if direction == .increment {
                item.score += 1
            } else {
                item.score -= 1
            }
        }
    }
}

struct ScoreRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScoreRow(item: .constant(.example))
            ScoreRow(item: .constant(.example))
                .preferredColorScheme(.dark)
                .environment(\.locale, Locale(identifier: "es"))
        }
    }
}

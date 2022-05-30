//
//  SelectSomethingView.swift
//  SimpleNews
//
//  Created by Paul Hudson on 29/05/2022.
//

import SwiftUI

/// A simple view to show in the detail pane of our top-level `NavigationView` when running in
/// a regular size class, e.g. on Max-side iPhones in landscape or iPads.
struct SelectSomethingView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "newspaper")
                .font(.largeTitle)
                .foregroundColor(.accentColor)

            Text("Welcome to SimpleNews!")
                .font(.title)

            Text("Please select an item to view.")

            Text("**Note:** All the text in this app was served up from the Guardian API via Hacking with Swift, and all copyright belongs to Guardian News and Media Limited or its affiliate companies. Please don't rely on it for productions apps, commercial purposes, or indeed anything important, because the feed might go away at any point in the future without warning, and your code will just break.")
                .padding()
        }
    }
}

struct SelectSomethingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSomethingView()
    }
}

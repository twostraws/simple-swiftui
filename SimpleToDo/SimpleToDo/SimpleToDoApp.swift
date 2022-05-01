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

/// The main struct for our app, responsible for creating the view model, setting up our
/// basic user interface, and also triggering a save when the app moves to the background.
@main
struct SimpleToDoApp: App {
    /// The main shared instance of our view model, created here once and sent into `ContentView`.
    @StateObject private var model = ViewModel()

    /// Used to detect when the app moves all scenes to the background, so we can trigger a save.
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(model: model)
                SelectSomethingView()
            }
        }
        .onChange(of: scenePhase) { phase in
            // When all our scenes have moved to the background, we force a save
            // immediately in case the user is about to terminate the app.
            if phase == .background {
                model.save()
            }
        }
    }
}

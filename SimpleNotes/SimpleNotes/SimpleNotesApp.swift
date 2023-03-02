//
//  SimpleNotesApp.swift
//  SimpleNotes
//
//  Created by Paul Hudson on 25/02/2023.
//

import SwiftUI

/// The main struct for our app, responsible for setting up our basic user interface as a macOS menu bar app showing as a window. 
@main
struct SimpleNotesApp: App {
    var body: some Scene {
        MenuBarExtra("Notes") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}

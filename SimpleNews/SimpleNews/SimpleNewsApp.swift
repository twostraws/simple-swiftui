//
//  SimpleNewsApp.swift
//  SimpleNews
//
//  Created by Paul Hudson on 29/05/2022.
//

import SwiftUI

/// The main struct for our app, responsible for setting up our basic user interface.
@main
struct SimpleNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                SelectSomethingView()
            }
        }
    }
}

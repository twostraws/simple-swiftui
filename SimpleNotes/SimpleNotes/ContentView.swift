//
//  ContentView.swift
//  SimpleNotes
//
//  Created by Paul Hudson on 25/02/2023.
//

import KeychainAccess
import SwiftUI

/// The main view for the app, showing the user note text, when it was last modified, and some controls.
struct ContentView: View {
    /// When the text was last saved.
    @AppStorage("lastSaved") private var lastSaved = Date.now

    /// The font size to use, defaulting to the macOS standard font size.
    @AppStorage("fontSize") var fontSize = 13.0

    /// Temporary storage for the user' note text, before it's saved.
    @State private var notes = ""

    /// A task that is able to save the user's text after a short delay.
    @State private var saveTask: Task<Void, Error>?

    /// An instance of Kishikawa Katsumi's Keychain class, to handle securely reading and writing data.
    let keychain = Keychain(service: "com.hackingwithswift.simplenotes")

    var body: some View {
        VStack {
            TextEditor(text: $notes)
                .frame(width: 400, height: 400)
                .font(.system(size: fontSize))

            HStack {
                ControlGroup {
                    Button {
                        fontSize -= 1
                    } label: {
                        Label("Decrease font size", systemImage: "textformat.size.smaller")
                    }

                    Button {
                        fontSize += 1
                    } label: {
                        Label("Increase font size", systemImage: "textformat.size.larger")
                    }

                    Button {
                        fontSize = 13
                    } label: {
                        Label("Reset font size", systemImage: "arrow.counterclockwise")
                    }
                }

                ControlGroup {
                    Button {
                        // When writing to the macOS clipboard, it's important you first clear its current contents.
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(notes, forType: .string)
                    } label: {
                        Label("Copy", systemImage: "doc.on.doc")
                    }

                    Button {
                        NSApp.terminate(nil)
                    } label: {
                        Label("Quit", systemImage: "power")
                    }
                }
            }

            Text("Last saved: \(lastSaved.formatted(date: .abbreviated, time: .standard))")
                .foregroundStyle(.secondary)
        }
        .padding()
        .onAppear(perform: load)
        .onChange(of: notes, perform: save)
    }

    /// Called on launch to load the user's saved note, or an empty string otherwise.
    func load() {
        notes = keychain["notes"] ?? ""
    }

    /// Saves the user's latest note text using a sleeping task so we don't write after every keypress.
    func save(newValue: String) {
        // If there is currently a sleeping save task active, cancel it now to avoid multiple writes.
        saveTask?.cancel()

        saveTask = Task {
            // Three seconds seems like a safe wait time, but honestly anything that's at least 1 is likely to be fine.
            try await Task.sleep(for: .seconds(3))
            keychain["notes"] = newValue
            lastSaved = .now
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

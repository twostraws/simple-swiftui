//
//  ContentView.swift
//  SimpleNews
//
//  Created by Paul Hudson on 29/05/2022.
//

import SwiftUI

/// The main listing view for the app, showing all the articles we downloaded.
struct ContentView: View {
    /// The current state of our article download
    enum LoadState {
        /// The download is currently in progress. This is the default.
        case loading

        /// The download has finished, and articles can now be displayed.
        case success

        /// The download failed.
        case failed
    }

    /// All the articles we have downloaded from the server.
    @State private var articles = [Article]()

    /// The current state of downloading our articles.
    @State private var loadState = LoadState.loading

    /// The text in our search box, which filters the articles array.
    @State private var searchText = ""

    var body: some View {
        Group {
            switch loadState {
            case .loading:
                VStack {
                    Text("Downloading…")
                    ProgressView()
                }
            case .success:
                List(filteredArticles, rowContent: ArticleRow.init)
					.refreshable(action: downloadArticles)
					.searchable(text: $searchText)
            case .failed:
                VStack {
                    Text("Failed to download articles")

                    Button("Retry") {
                        // When the user attempts to retry, immediately switch back to
                        // the loading state.
                        loadState = .loading

                        Task {
                            // Important: wait 0.5 seconds before retrying the download, to
                            // avoid jumping straight back to .failed in case there are
                            // internet problems.
                            try await Task.sleep(nanoseconds: 500_000_000)
                            await downloadArticles()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .navigationTitle("SimpleNews")
        .task(downloadArticles)
    }

    /// Filters the articles array based on the user's search criteria.
    var filteredArticles: [Article] {
        if searchText.isEmpty {
            return articles
        } else {
            return articles.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    /// Downloads the latest news JSON from Hacking with Swift, decodes it into an array of `Article`
    /// objects, then assigns it to the `articles` property. This will also update the `loadState`
    /// based on how the whole process went.
    @Sendable func downloadArticles() async {
        do {
            let url = URL(string: "https://hws.dev/news")!
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            articles = try decoder.decode([Article].self, from: data).sorted()
            loadState = .success
        } catch {
            loadState = .failed
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

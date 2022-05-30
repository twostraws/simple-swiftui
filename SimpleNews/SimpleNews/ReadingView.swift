//
//  ReadingView.swift
//  SimpleNews
//
//  Created by Paul Hudson on 29/05/2022.
//

import SwiftUI

/// A view that shows the full details for a specific article, for scrolling reading.
struct ReadingView: View {
    /// An action to let the user open this article in their preferred web browser.
    @Environment(\.openURL) var openURL

    /// The article they want to read.
    let article: Article

    var body: some View {
        ScrollView {
            AsyncImage(url: article.image) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Image(systemName: "newspaper")
                }
            }

            VStack(alignment: .leading, spacing: 20) {
                Text(article.title)
                    .font(.title)

                Text(article.description)
                    .font(.headline)
                    .foregroundColor(.secondary)

                Divider()

                VStack(alignment: .leading) {
                    Text(article.author)
                        .font(.headline.weight(.heavy))

                    Text(article.date.formatted(date: .abbreviated, time: .standard))
                        .font(.headline)
                }

                Text(article.text)
            }
            .padding(.horizontal)
        }
        .navigationTitle(article.section)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                // Open this article in their preferred web browser.
                openURL(article.url)
            } label: {
                Label("Open in your web browser", systemImage: "safari")
            }
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReadingView(article: .example)
        }
    }
}

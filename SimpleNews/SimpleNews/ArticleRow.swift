//
//  ArticleRow.swift
//  SimpleNews
//
//  Created by Paul Hudson on 29/05/2022.
//

import SwiftUI

/// Displays a single item from the list in `ContentView`.
struct ArticleRow: View {
    /// The article this row should be showing.
    let article: Article

    var body: some View {
        NavigationLink {
            ReadingView(article: article)
        } label: {
            HStack {
                AsyncImage(url: article.thumbnail) { phase in
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
                .frame(width: 80, height: 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading) {
                    Text(article.section)
                        .font(.caption.weight(.heavy))
                    Text(article.title)
                }
            }
        }
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(article: .example)
    }
}

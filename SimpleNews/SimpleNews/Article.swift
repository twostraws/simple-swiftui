//
//  Article.swift
//  SimpleNews
//
//  Created by Paul Hudson on 29/05/2022.
//

import Foundation

/// One article in our downloaded data.
struct Article: Decodable, Identifiable, Comparable {
    /// The unique identifier string.
    let id: String

    /// The part of the Guardian API this belongs to, e.g. World News or Sport.
    var section: String

    /// The main title for the article.
    var title: String

    /// A subheadline or teaser giving more information about the article.
    var description: String

    /// One or more authors responsible for this article.
    var author: String

    /// The main body text.
    var text: String

    /// A 500x500 image suitable for showing at smaller sizes.
    var thumbnail: URL

    /// A 1000x1000 image suitable for showing in `ReadingView`
    var image: URL

    /// The publication date for this article.
    var date: Date

    /// The URL for the full article on the web.
    var url: URL

    /// A custom comparator that sorts articles newest first.
    static func <(lhs: Article, rhs: Article) -> Bool {
        lhs.date > rhs.date
    }

    /// An example property that's used for Xcode previewing.
    static let example = Article(id: "1", section: "News", title: "Apple buys Hacking with Swift", description: "What a way to spend $10 million!", author: "Not Paul Hudson", text: "In a move that shocked everyone, especially Tim Cook and Paul Hudson, Apple bought hackingwithswift.com", thumbnail: URL(string: "https://hws.dev/img/logo.png")!, image: URL(string: "https://hws.dev/img/logo.png")!, date: .now, url: URL(string: "https://www.hackingwithswift.com")!)
}

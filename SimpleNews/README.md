# SimpleNews

SimpleNews is a news reader app written in SwiftUI, fetching JSON data from a server and decoding it using `Codable`.


## Understanding the code

I think you’ll be pleasantly surprised by how little logic there is in this project – almost all the “work” is really just describing the SwiftUI layout. In fact, almost all the meaningful logic is contained in the relatively short `downloadArticles()` method of ContentView.swift, which handles fetching and decoding from the server, but there’s also a small amount extra in the `filteredArticles` property to handle searching through the data.

Things to watch out for:

- If the initial fetch fails, users will see a Retry button to try again. This waits half a second before triggering the fetch, so that users definitely see a loading spinner briefly in case the fetch fails again.
- Users can choose to read an article in their preferred web browser, thanks to the `openURL` environment key in `ReadingView`.
- The `Article` struct conforms to `Comparable` so that articles are displayed in newest-first order.
- Both the `AsyncImage` views show an activity indicator while loading, or a simple placeholder icon on failure – it wouldn’t be hard to spin that out into its own miniature view that just needs the URL to display.
- There is no caching, but it wouldn’t be hard to add if you wanted to take this project further.


## Credits

SimpleNews was made by [Paul Hudson](https://twitter.com/twostraws) as part of the [Simple SwiftUI](https://github.com/twostraws/simple-swiftui) project. It’s available under the MIT license, which permits commercial use, modification, distribution, and private use.

**Important:** The news API used in this project draws upon the Guardian API, and you will see warnings in the returned text reminding you of this. The Hacking with Swift server API is available only for learning purposes, and you should not attempt to ship any commercial products using it, use it in production, or indeed use it in anything you consider important because the API might go away at any point in the future and without warning.

All copyright for the articles and their associated media belongs to Guardian News and Media Limited or its affiliate companies. If you intend to use their content in actual apps, you should apply for your own API key then access their API directly. Find out more here: <https://open-platform.theguardian.com/access/>.

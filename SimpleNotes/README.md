# SimpleNotes

SimpleNotes is a notes scratchpad built for the macOS menu bar, using an external package to handle secure storage using the keychain.


## Understanding the code

The absolute core of this project shows how little code is takes to produce a menu bar app for macOS using SwiftUI’s `MenuBarExtra` API.

However, there are a handful of things to watch out for:

- The `@AppStorage` property wrapper is great for storing the user’s preferred font size, but should *not* be used for storing the user’s text because it is *not* secure. Instead, we use the macOS keychain, which is securely encrypted.
- When the user changes their notes text it starts a three-second task delay before saving their new note text, to avoid burning through CPU time as they type.
- Storing a date in `@AppStorage` is not possible without adding an extension on `Date`. This rounds the date to an integer, storing the number of whole seconds that have elapsed since January 1st 2001, which is more than accurate enough for our purposes here.
- Before writing anything to the macOS clipboard, it’s important to call `NSPasteboard.general.clearContents()` first.

## Credits

SimpleNotes was made by [Paul Hudson](https://twitter.com/twostraws) as part of the [Simple SwiftUI](https://github.com/twostraws/simple-swiftui) project. It’s available under the MIT license, which permits commercial use, modification, distribution, and private use.

This project uses the [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess) library from [Kishikawa Katsumi](https://hachyderm.io/@kishikawakatsumi) to handle secure storage of the user’s note text.

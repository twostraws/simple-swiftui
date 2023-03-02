
<p align="center">
    <img src="https://www.hackingwithswift.com/files/simple-swiftui/logo.png" alt="Simple SwiftUI logo" width="648" maxHeight="156" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/iOS-15.0+-blue.svg" />
    <img src="https://img.shields.io/badge/Swift-5.7-brightgreen.svg" />
    <a href="https://twitter.com/twostraws">
        <img src="https://img.shields.io/badge/Contact-@twostraws-orange" alt="Twitter: @twostraws" />
    </a>
</p>

Simple SwiftUI is a small but growing collection of projects designed to provide small sample projects for SwiftUI learners to read, learn from, modify, and even use as a basis for their projects in the future.


## What’s available

Each project in Simple SwiftUI is designed to stand alone as an example solution to a common starter project. This means they don’t have special frills, weird hacks, “clever code”, or similar – they are designed to get one specific job done, rather than demonstrate every possible SwiftUI view and modifier in a single project.

Right now there are just four projects available, but more will be added in time:

- [SimpleNews](SimpleNews) is a news reader
- [SimpleNotes](SimpleNotes) is a macOS menu bar notes app
- [SimpleScores](SimpleScores) is a score tracker
- [SimpleToDo](SimpleToDo) is a to do list editor

The goal is to build up a collection of SwiftUI projects that do one job and do it well, all updated for the latest versions of Swift and SwiftUI so they make for ideal projects for folks to read through and find high-quality code they can learn from.

**Tip:** All projects here are configured to use SwiftLint as part of their build process, which helps to enforce standard coding style and conventions. [SwiftLint is free to install here](https://github.com/realm/SwiftLint), and is highly recommended.


## Learn how they were made

I produced these projects on livestreams as part of [Hacking with Swift+](https://www.hackingwithswift.com/plus) – there are videos there along with transcriptions, so you can see exactly how the apps are put together, and why I made certain choices.


## Contributing

I’ll be adding more projects here in the future, but there are lots of things anyone can help with:

- Identifying and fixing any bugs.
- Identifying and implementing opportunities to simplify the code.
- Identifying and improving any accessibility problems.
- Adding tests – unit tests, UI tests, and performance tests are welcome.
- Writing comments and other documentation designed to make the projects more easily understood.
- Updating any old Swift or SwiftUI code, so that the projects all target the latest stable version of iOS and Xcode.
- Ensuring all files build without warnings, including warnings issued by SwiftLint.

If you would like to contribute, please keep these things in mind:

- The goal isn’t to pack each app with features, in fact the more code we remove the better. This means we don’t need to make every list searchable, for example – there will be a project just for that topic.
- If there is no option but to use a workaround, e.g. for something SwiftUI doesn’t support yet, then go for it! These are real-world projects, and these projects need to reflect that.
- If you modify code, please make sure it is thoroughly documented so that someone reading the project can understand it. This is doubly important for any workarounds.
- If you contribute code or other assets, please make sure it’s something you wrote yourself, and that you are happy to license it under the MIT license so that others can use it freely.

Above all, please keep your code as simple as possible – if you can avoid more advanced features like generics and protocol extensions, please do.


## Credits

Simple SwiftUI was made by [Paul Hudson](https://twitter.com/twostraws), who writes [free Swift tutorials over at Hacking with Swift](https://www.hackingwithswift.com). All code here is released under the MIT license, which permits commercial use, modification, distribution, and private use.

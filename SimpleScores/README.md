# SimpleScores

SimpleScores is a score tracking app written in SwiftUI, saving data using `Codable`.


## Understanding the code

All the data is accessed using the `ViewModel` class, which is created inside `SimpleScoresApp` and shared everywhere. This class is responsible for loading and saving the data using `Codable` and the app’s documents directory, and also adding and deleting data while the app is running.

Things to watch out for:

- `ScoreRow` is created using bindings to the shared view model class, meaning that any change the user makes is automatically stored in the view model and written out to disk.
- Screen space is maximized by providing `ScoreRow` with custom list insets and allowing its text field to resize down to 75% of its regular font size.
- Data in `ViewModel` is automatically saved after 5 seconds of not being changed, or if the user exits the app.
- The app uses `preferredColorScheme(.dark)` in `SimpleScoresApp` to ensure dark mode is used everywhere.
- Using plain list and button styles in `ContentView` gives us more control over the exact look and feel of this screen.
- There are several important accessibility modifiers in `ScoreRow`, all of which combine to ensure that the app works well with assistive technologies such as VoiceOver.


## Credits

SimpleScores was made by [Paul Hudson](https://twitter.com/twostraws) as part of the [Simple SwiftUI](https://github.com/twostraws/simple-swiftui) project. It’s available under the MIT license, which permits commercial use, modification, distribution, and private use.


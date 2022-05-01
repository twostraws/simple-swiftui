# SimpleToDo

SimpleToDo is a to do list tracker written in SwiftUI, saving data using `Codable`.


## Understanding the code

All the data is accessed using the `ViewModel` class, which is created inside `SimpleToDoApp` and shared everywhere. This class is responsible for loading and saving the data using `Codable` and the app’s documents directory, and also adding and deleting data while the app is running.

Things to watch out for:

- `ItemRow`, and `DetailView` are both created using bindings to the shared `ViewModel`, meaning that any change the user makes is automatically stored in the view model and written out to disk.
- The main `NavigationView` uses `SelectSomethingView` to have something to display in the detail area of the view where applicable – a Max-sized iPhone in landscape, for example.
- `ContentView` tracks its own `EditMode` property rather than using the one from the environment, because it makes for simpler code. This edit mode is used to determine whether to show a trash toolbar icon or not.
- Data in `ViewModel` is automatically saved after 5 seconds of not being changed, or if the user exits the app.



## Credits

SimpleToDo was made by [Paul Hudson](https://twitter.com/twostraws) as part of the [Simple SwiftUI](https://github.com/twostraws/simple-swiftui) project. It’s available under the MIT license, which permits commercial use, modification, distribution, and private use.


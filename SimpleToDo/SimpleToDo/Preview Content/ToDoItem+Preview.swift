// Copyright © 2022 Paul Hudson.
// Licensed under MIT license.
//
// https://github.com/twostraws/simple-swiftui
// See LICENSE for license information
//

import Foundation

/// Code in this folder is not included when creating an archive to send to the app store, in the same way that the code for SwifUI Previews are stripped out of archived builds
extension ToDoItem {
    /// An example property that's used for Xcode previewing.
    static let example = ToDoItem()
}

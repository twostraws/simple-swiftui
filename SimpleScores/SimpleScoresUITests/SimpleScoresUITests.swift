// Copyright © 2022 Paul Hudson.
//
// https://github.com/twostraws/simple-swiftui
// See LICENSE for license information
//

import XCTest

class SimpleScoresUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = ["clearAll"]
        app.launch()
    }

    // Set App Language to English, otherwise elements cannot be found

    func testAddingNewPlayerWorks() throws {
        // Setup - Get the current amount of players
        let currentPlayerAmount = app.tables.cells.count

        // Action - Tap button once
        app.buttons["Add Player"].tap()

        // Assert - Get the updated amount of players and check that it is 1 higher
        let updatePlayerAmount = app.tables.cells.count
        XCTAssertEqual(updatePlayerAmount, currentPlayerAmount + 1)
    }

    func testDeletingAllPlayersWorks() throws {
        // Setup - Make sure there are players to delete
        app.buttons["Add Player"].tap()
        app.buttons["Add Player"].tap()
        let beforePlayerCount = app.tables.cells.count
        XCTAssertGreaterThan(beforePlayerCount, 1)

        // Action - Tap remove all button and confirm alert
        app.buttons["Remove All"].tap()
        app.alerts.buttons["Delete"].tap()

        // Wait up to 2 seconds for delete to complete and update the UI
        // The cell "Add Player" is always there so count should be 1 after all players are deleted
        let countIsOne = NSPredicate(format: "count == 1")
        expectation(for: countIsOne, evaluatedWith: app.tables.cells, handler: nil)
        waitForExpectations(timeout: 2, handler: nil)

        // Assert - Get the updated amount of player.
        // The cell "Add Player" is always there so subtract 1
        let afterPlayerCount = app.tables.cells.count - 1
        XCTAssertEqual(afterPlayerCount, 0)
    }
}

//
//  ViewModelTests.swift
//  SimpleScoresTests
//
//  Created by David Steppenbeck on 06/05/2022.
//

import XCTest
@testable import SimpleScores

final class ViewModelTests: XCTestCase {

    private var sut: ViewModel!

    override func setUp() {
        super.setUp()
        sut = ViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAdd() {
        // The `add()` method should add one new item to the `items` array.
        let initialCount = sut.items.count
        sut.add()

        // The result that is expected from the system under test.
        let expectation = initialCount + 1

        // Check the actual value against the expected result.
        let result = sut.items.count
        XCTAssertEqual(result, expectation)
    }

    func testDelete() {
        // The `delete(_:)` method should delete items from the array for the specified `IndexSet`.
        // Make sure the `items` array has at least one element for testing purposes.
        let item = Score()
        sut.items.append(item)
        let initialCount = sut.items.count
        let indexSet = IndexSet(integer: 0)
        sut.delete(indexSet)

        // The result that is expected from the system under test.
        let expectation = initialCount - 1

        // Check the actual value against the expected result.
        let result = sut.items.count
        XCTAssertEqual(result, expectation)
    }

    func testDeleteAll() {
        // The `deleteAll()` method should delete all items from the `items` array, leaving none behind.
        // Make sure the `items` array has at least one element for testing purposes.
        let item = Score()
        sut.items.append(item)
        sut.deleteAll()

        // The result that is expected from the system under test.
        let expectation = 0

        // Check the actual value against the expected result.
        let result = sut.items.count
        XCTAssertEqual(result, expectation)
    }

    func testReset() {
        // The `reset()` method should set all scores in the `items` array back to zero.
        // Make sure the `items` array has at least one element with non-zero score for testing purposes.
        let item = Score(score: 1)
        sut.items.append(item)
        sut.reset()

        // Check the actual value against the expected result.
        let result = sut.items.map(\.score).allSatisfy { $0 == 0 }
        XCTAssertTrue(result)
    }

}

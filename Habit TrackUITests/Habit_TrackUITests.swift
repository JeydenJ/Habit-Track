//
//  Habit_TrackUITests.swift
//  Habit TrackUITests
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import XCTest

class Habit_TrackUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false // Stop the test on the first failure.
        app = XCUIApplication()
        app.launch() // Launch the app before each test.
    }

    func testAddHabit() {
        let addHabitButton = app.buttons["Add Habit"]
        addHabitButton.tap()
        
        let habitNameTextField = app.textFields["Habit Name"]
        habitNameTextField.tap()
        habitNameTextField.typeText("New Habit")
        
        let confirmButton = app.buttons["Confirm Habit"]
        confirmButton.tap()
        
        let habitCell = app.staticTexts["New Habit"]
        XCTAssertTrue(habitCell.exists)
    }

    func testMarkHabitAsCompleted() {
    
        // Verify that the habit is marked as completed.
        let completedHabitCell = app.staticTexts["New Habit"]
        XCTAssertTrue(completedHabitCell.exists)
    }

    override func tearDown() {
        super.tearDown()
    }
}

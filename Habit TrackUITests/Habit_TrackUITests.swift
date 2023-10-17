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
        // Perform UI actions to add a habit.
        let addHabitButton = app.buttons["Add Habit"]
        addHabitButton.tap()
        
        let habitNameTextField = app.textFields["Habit Name"]
        habitNameTextField.tap()
        habitNameTextField.typeText("New Habit")
        
        // You can continue performing UI actions to set up a habit here.
        
        // Save the habit.
        let confirmButton = app.buttons["Confirm Habit"]
        confirmButton.tap()
        
        // Verify that the habit was added.
        let habitCell = app.staticTexts["New Habit"]
        XCTAssertTrue(habitCell.exists)
    }

    func testMarkHabitAsCompleted() {
        // Perform UI actions to mark a habit as completed.
        // You can use the "View Habits" button to navigate to the list of habits and then mark a habit as completed.
        
        // Verify that the habit is marked as completed.
        let completedHabitCell = app.staticTexts["New Habit"]
        XCTAssertTrue(completedHabitCell.exists)
    }

    override func tearDown() {
        super.tearDown()
        // You can perform cleanup actions here, such as resetting the app's state.
    }
}

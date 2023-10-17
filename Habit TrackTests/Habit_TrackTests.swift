//
//  Habit_TrackTests.swift
//  Habit TrackTests
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import XCTest
@testable import Habit_Track

final class Habit_TrackTests: XCTestCase {
    
    var habitList: HabitList!
    
    override func setUp() {
        super.setUp()
        habitList = HabitList()
    }
    
    override func tearDown() {
        habitList = nil
        super.tearDown()
    }
    
    func testHabitCreation() {
        let habit = Habit(name: "Test Habit", color: "Blue", frequency: "Daily", reminderTime: Date(), isCompleted: false)
        
        habitList.habits.append(habit)
        
        XCTAssertEqual(habitList.habits.count, 1)
        
        // Assert that the habit's properties match the expected values
        XCTAssertEqual(habitList.habits[0].name, "Test Habit")
        XCTAssertEqual(habitList.habits[0].color, "Blue")
        XCTAssertEqual(habitList.habits[0].frequency, "Daily")
        XCTAssertFalse(habitList.habits[0].isCompleted)
    }
    
    func testHabitDeletion() {
        
        let habit = Habit(name: "Test Habit", color: "Blue", frequency: "Daily", reminderTime: Date(), isCompleted: false)
        
        habitList.habits.append(habit)
        
        
        XCTAssertEqual(habitList.habits.count, 1)
        
        habitList.habits.remove(at: 0)
        
        // Assert that the habit was deleted
        XCTAssertEqual(habitList.habits.count, 0)
    }
    
    
    
    
    
    
    
    
}

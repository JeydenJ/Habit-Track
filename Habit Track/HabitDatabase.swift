//
//  HabitDatabase.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 16/10/2023.
//
import Foundation
import SQLite
import SwiftUI

class HabitDatabase: ObservableObject {
    
    private var db: Connection
    private let habits = Table("habits")
    private let id = Expression<Int>("id")
    private let name = Expression<String>("name")
    private let color = Expression<String>("color")
    private let frequency = Expression<String>("frequency")
    private let reminderTime = Expression<Date>("reminderTime")
    private let isCompleted = Expression<Bool>("isCompleted")

    init() {
            // Initialize the database connection and create the habits table if it doesn't exist.
            do {
                let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                print("SQLite Database Directory: \(documentsDirectory)")
                let databaseFileURL = documentsDirectory.appendingPathComponent("habits.sqlite")
                db = try Connection(databaseFileURL.path)
                
               createHabitsTable()
            } catch {
                fatalError("Error initializing database: \(error)")
            }
        }

    private func createHabitsTable() {
        Task {
            do {
                // Check if the table doesn't exist
                if !((try? db.scalar(habits.exists)) != nil) {
                    // Create the "habits" table
                    try db.run(habits.create { table in
                        table.column(id, primaryKey: .autoincrement)
                        table.column(name)
                        table.column(color)
                        table.column(frequency)
                        table.column(reminderTime)
                        table.column(isCompleted)
                    })
                }
            } catch {
                fatalError("Error creating habits table: \(error)")
            }
        }
    }


    func insertHabit(habit: Habit) {
        do {
            _ = try db.run(habits.insert(
                name <- habit.name,
                color <- habit.color,
                frequency <- habit.frequency,
                reminderTime <- habit.reminderTime,
                isCompleted <- habit.isCompleted
            ))
        } catch {
            fatalError("Error inserting habit: \(error)")
        }
    }

    func retrieveHabits() -> [Habit] {
        var habitList: [Habit] = []
        do {
            for habit in try db.prepare(habits) {
                let colorName = habit[color]
                let color = self.getColorFromName(colorName)
                let retrievedHabit = Habit(
                    name: habit[name],
                    color: color,
                    frequency: habit[frequency],
                    reminderTime: habit[reminderTime],
                    isCompleted: habit[isCompleted]
                )
                habitList.append(retrievedHabit)
            }
        } catch {
            fatalError("Error retrieving habits: \(error)")
        }
        return habitList
    }

    private func getColorFromName(_ name: String) -> String {
        switch name {
        case "Blue":
            return "Blue"
        case "Green":
            return "Green"
        case "Red":
            return "Red"
        default:
            return "Blue"
        }
    }
    func deleteAllHabits() {
        do {
            try db.run(habits.delete())
        } catch {
            fatalError("Error deleting all habits: \(error)")
        }
    }
}

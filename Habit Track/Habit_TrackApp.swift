//
//  Habit_TrackApp.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import SwiftUI

@main
struct Habit_TrackApp: App {
    @StateObject var habitList = HabitList()
    @StateObject var habitDatabase = HabitDatabase()
    let persistenceController = PersistenceController.shared

    
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(habitList)
                .environmentObject(habitDatabase)
        }
    }
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
    }
}

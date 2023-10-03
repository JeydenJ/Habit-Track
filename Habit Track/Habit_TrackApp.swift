//
//  Habit_TrackApp.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import SwiftUI

@main
struct Habit_TrackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

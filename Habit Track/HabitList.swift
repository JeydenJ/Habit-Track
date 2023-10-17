//
//  HabitList.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 12/10/2023.
//

import SwiftUI

struct Location {
    let latitude: Double
    let longitude: Double
}

class HabitList: ObservableObject {
    @Published var habits: [Habit] = []
}

struct Habit: Identifiable {
    let id = UUID()
    let name: String
    let color: String
    let frequency: String
    var reminderTime: Date
    var isCompleted: Bool
    var location: Location?
}

struct HabitListView: View {
    @ObservedObject var habitDatabase: HabitDatabase
    @State var habits: [Habit] = []
    @EnvironmentObject var habitList: HabitList
    
    func markAsCompleted(for habit: Habit) {
        if !habit.isCompleted {
            habitList.habits = habitList.habits.map { existingHabit in
                if existingHabit.id == habit.id {
                    var updatedHabit = existingHabit
                    updatedHabit.isCompleted = true
                    return updatedHabit
                }
                return existingHabit
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(habitList.habits) { habit in
                HStack {
                    Circle()
                        .fill(mapColor(habit.color))
                        .frame(width: 30, height: 30)

                    
                    Text(habit.name)
                        .font(.title)
                    
                    Text("Reminder: \(habit.reminderTime, style: .time)")
                    
                    Button(action: {
                        markAsCompleted(for: habit)
                    }) {
                        Text("Mark Completed")
                    }
                    
                    if habit.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                    }
                }
                .background(habit.isCompleted ? Color.green : Color.white) // Set the background color for the entire HStack
            }
        }
        .onAppear {
                   habits = habitDatabase.retrieveHabits()
                   // Update the habitList with retrieved habits
                   habitList.habits = habits
               }    }
}
func mapColor(_ colorName: String) -> Color {
    switch colorName {
    case "Blue":
        return .blue
    case "Green":
        return .green
    case "Red":
        return .red
    default:
        return .blue // You can set a default color if the name doesn't match any predefined color.
    }
}

struct HabitList_Previews: PreviewProvider {
    static var previews: some View {
        let habitDatabase = HabitDatabase()
        HabitListView(habitDatabase: habitDatabase)
    }
}



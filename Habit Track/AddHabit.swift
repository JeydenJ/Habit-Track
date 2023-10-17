//
//  AddHabit.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 12/10/2023.
//
import SwiftUI

struct AddHabit: View {
    @EnvironmentObject var habitDatabase: HabitDatabase
    @EnvironmentObject var habitList: HabitList
    @State private var habitName = ""
    @State private var frequency = "Daily"
    @State private var startDate = Date()
    @State private var reminder = Date()
    @State private var selectedColorName = "Blue" // Store the color name as a string
    @State private var isHabitListActive = false
    
    @State private var habitAdded = false
    @State private var showAlert = false

    let habitColors: [String] = ["Blue", "Green", "Red"]
    
    

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Habit Details")) {
                    TextField("Habit Name", text: $habitName)

                    Picker("Frequency", selection: $frequency) {
                        Text("Daily").tag("Daily")
                        Text("Weekly").tag("Weekly")
                        Text("Monthly").tag("Monthly")
                    }

                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)

                    DatePicker("Reminder", selection: $reminder, displayedComponents: .hourAndMinute)
                }

                Section(header: Text("Select Color")) {
                    Picker("Color", selection: $selectedColorName) {
                        ForEach(habitColors, id: \.self) { colorName in
                            Text(colorName)
                        }
                    }
                }

                // Display the selected color using SwiftUI's Color
                Circle()
                    .fill(self.getColorFromName(selectedColorName))
                    .frame(width: 44, height: 44)

                Section {
                    Button(action: {
                        let newHabit = Habit(name: habitName, color: selectedColorName, frequency: frequency, reminderTime: reminder, isCompleted: false)
                        
                        // Insert the habit into the database
                        habitDatabase.insertHabit(habit: newHabit)
                        
                        // Schedule the notification
                        scheduleNotification()
                        
                        habitList.habits.append(newHabit)
                        isHabitListActive = true
                        
                        showAlert = true
                        
                        print("New Habit Added:")
                        print("Name: \(newHabit.name)")
                        print("Color: \(newHabit.color)")
                        print("Reminder Time: \(newHabit.reminderTime)")
                        print("Is Completed: \(newHabit.isCompleted)")
                    }) {
                        Text("Confirm Habit")
                    }
                }
            }
            .navigationBarTitle("Add Habit")
            
        }
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Habit Added"), message: Text("Your new habit has been added."), dismissButton: .default(Text("OK")) {
                        // Navigate to HabitView after the alert is dismissed
                        habitAdded = true
                    })
                }
                // Place NavigationLink outside of the Form
                NavigationLink(destination: HabitView(), isActive: $habitAdded, label: { EmptyView() })
            .navigationBarBackButtonHidden(true)
    }

    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Habit Reminder"
        content.body = "Don't forget to do your habit: \(habitName)"
        content.sound = .default
        
        let calendar = Calendar.current
        let triggerDateComponents = calendar.dateComponents([.hour, .minute], from: reminder)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
    private func getColorFromName(_ name: String) -> Color {
        switch name {
        case "Blue":
            return .blue
        case "Green":
            return .green
        case "Red":
            return .red
        default:
            return .blue
        }
    }

    struct AddHabit_Previews: PreviewProvider {
        static var previews: some View {
            AddHabit()
        }
    }
}



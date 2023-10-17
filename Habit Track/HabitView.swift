//
//  HabitView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 5/10/2023.
//

import SwiftUI

struct HabitView: View {
    @EnvironmentObject var habitDatabase: HabitDatabase
    @State private var showAddHabitView = false
    @State private var showListHabitView = false
    @State private var showLocationView = false
    @State private var showAddLocationView = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Habits")
                    .font(.largeTitle)
                    .padding()
                // Button to navigate to AddHabit View
                Button(action: {
                    showAddHabitView = true
                }) {
                    Text("Add Habit")
                        .font(.headline)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink("", destination: AddHabit(), isActive: $showAddHabitView)

                // Button to navigate to the HabitListView
                Button(action: {
                    
                    showListHabitView = true
                    
                }) {
                    Text("View Habits")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink("", destination: HabitListView(habitDatabase: habitDatabase), isActive: $showListHabitView)

                // Button to navigate to the LocationView
                Button(action: {
                    showLocationView = true
                }) {
                    Text("View Location")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink("", destination: LocationView(selectedLocation: .constant(Location(latitude: 37.7749, longitude: -122.4194))), isActive: $showLocationView)
                
                // Button to navigate to the AddLocationView
                Button(action: {
                    showAddLocationView = true
                }) {
                    Text("Add Location")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink("", destination: AddLocationView(), isActive: $showAddLocationView)

            }
        }
    }
}


struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView()
    }
}

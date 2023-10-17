//
//  ContentView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import SwiftUI
import CoreData

struct StartView: View {
    @EnvironmentObject var habitDatabase: HabitDatabase
    @State private var userName = ""
    @State private var isProceeding = false
    @State private var nameError: String? // To store the error message

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Habit Tracker")
                    .font(.largeTitle)
                    .padding()
                
                Text("Please enter your name:")
                    .font(.title)
                    .padding()
                
                TextField("Name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if let error = nameError {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Navigation to MainView with validation
                NavigationLink(destination: MainView(), isActive: $isProceeding) {
                    EmptyView()
                }
                
                Button(action: {
                    
                    validateName()
                }) {
                    Text("Proceed")
                        .font(.headline)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .opacity(isProceeding ? 0 : 1)
                .padding()
                 
            }
            .padding()
        }
    }
    
    private func validateName() {
        if userName.isEmpty {
            nameError = "Please enter your name."
        } else if userName.count > 20 {
            nameError = "Name is too long."
        } else {
            nameError = nil
            isProceeding = true
        }
    }
    
    struct StartView_Previews: PreviewProvider {
        static var previews: some View {
            StartView()
        }
    }
}

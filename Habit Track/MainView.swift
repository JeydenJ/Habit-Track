//
//  MainView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import SwiftUI

struct MainView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showHabitView = false 
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Habit Track")
                    .font(.largeTitle)
                    .padding()
                // Navigate to HabitView when the habits button is pressed
                Button(action: {
                    self.showHabitView = true
                }) {
                    
                    Text("Habits")
                        .font(.headline)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                }
                
                NavigationLink("", destination: HabitView(), isActive: $showHabitView)
                    .opacity(0)
                // Logout button
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Logout")
                        .font(.headline)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                .padding()
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

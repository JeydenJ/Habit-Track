//
//  HabitView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 5/10/2023.
//

import SwiftUI

struct HabitView: View {
    @State private var showAddHabitView = false
    @State private var showListHabitView = false
    var body: some View {
        NavigationView{
            VStack{
                Text("Habits")
                    .font(.largeTitle)
                    .padding()
                    
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
                NavigationLink("", destination: HabitList(), isActive: $showListHabitView)
                
                
            }
        }
        
        
        
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView()
    }
}

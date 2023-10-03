//
//  ContentView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import SwiftUI
import CoreData

struct StartView: View {
    @State private var userName = ""
    @State private var isProceeding = false
    
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
            
                NavigationLink(destination: MainView()) {
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
    
    struct StartView_Previews: PreviewProvider {
        static var previews: some View {
            StartView()
        }
    }
}

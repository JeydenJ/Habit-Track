//
//  AddLocationView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 13/10/2023.
//
import SwiftUI

struct AddLocationView: View {
    @State private var selectedLocation: Location? = nil

    var body: some View {
        VStack {
            // Display the LocationView for selecting a location
            LocationView(selectedLocation: $selectedLocation)

            // Button to save the selected location
            Button(action: {
                if selectedLocation != nil {
                   
                }
            }) {
                Text("Save Location")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}


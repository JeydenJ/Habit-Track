//
//  MainView.swift
//  Habit Track
//
//  Created by Jeyden Johnson on 3/10/2023.
//

import SwiftUI

struct MainView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
        
            Button(action: {
                
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Exit")
                    .font(.headline)
                    .foregroundColor(.red)
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

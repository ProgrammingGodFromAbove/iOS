//
//  ContentView.swift
//  WeSplit
//
//  Created by Bumsu Kim on 1/28/24.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Hermeone", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent){
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }.navigationTitle("Select a student")
    }
}
#Preview {
    ContentView()
}


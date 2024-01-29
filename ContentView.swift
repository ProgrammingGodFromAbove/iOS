//
//  ContentView.swift
//  DutchPayApp
//
//  Created by Bumsu Kim on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalAmount : Double = 0
    @State private var tipPercentage : Int = 20
    @State private var numberOfPeople : Int = 2
    
    @FocusState private var totalAmountFocused : Bool
    
    let tipPercentages = [10,15, 20,25,0]
    
    var perPerson : Double {
        
        return (Double(totalAmount) + Double(totalAmount) * (Double(tipPercentage)/100)) / Double(numberOfPeople)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    TextField("Total Amount", value: $totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad)
                        .focused($totalAmountFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        
                        ForEach(2..<100) {
                            Text("\($0-2)")
                        }
                    }
                    
                    
                }
                
                Section("Tip Percentage") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section("Dutch pay price") {
                    
                    Text(perPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }.navigationTitle("Dutch Pay App")
                .toolbar {
                    if totalAmountFocused {
                        Button("Done") {
                            totalAmountFocused = false
                        }
                        
                    }
                }
        }
        
        
    }
    
    
}

#Preview {
    ContentView()
}

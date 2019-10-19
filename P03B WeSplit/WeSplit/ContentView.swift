//
//  ContentView.swift
//  WeSplit
//
//  Created by Jason Rueckert on 10/11/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    // Challenge 3
    @State private var numberOfPeople = ""
    // @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var useRedText = false
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        // Challenge 3
        let peopleCount = Double((Int(numberOfPeople) ?? 2) + 2)
//        let peopleCount = Double(numberOfPeople + 2)
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    // Challenge 2
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    // Challenge 3
                    TextField("Number of people", text: $numberOfPeople)
                    .keyboardType(.numberPad)
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2..<100) {
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            // Challenge 2
                            
                            Text("\(self.tipPercentages[$0])%")
                            
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                // Challenge 2
                Section(header: Text("Total check amount")) {
                    if(tipPercentage == 4) {
                        Text("$\(totalAmount, specifier: "%.2f")")
                            .foregroundColor(.red)
                    } else {
                        Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(.black)
                    }
                }
                // Challenge 1
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

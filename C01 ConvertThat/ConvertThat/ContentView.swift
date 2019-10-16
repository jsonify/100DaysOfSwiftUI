//
//  ContentView.swift
//  ConvertThat
//
//  Created by Jason Rueckert on 10/14/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var unitInput = ""
    @State private var m = 1.0
    @State private var km = 1000.0
    @State private var ft = 3.28084
    @State private var yard = 1.093613
    @State private var mile = 0.000621
    
    @State private var cm = 0
    @State private var mm = 0
    @State private var inch = 0
    
    @State private var unitInputType = 0
    @State private var unitOutputType = 0
    
    let unitInputTypes = ["Km", "Ft", "Yards", "Miles"]
    
    let unitOutputTypes = ["Meters", "Km", "Ft", "Yards", "Miles"]
    
    var convertedOutputType: Double {
        let amount = Double(unitInput) ?? 0
        return amount
    }
    
    // take a quantity and convert it to a double
    var convertedQuantity: Double {
        return Double(unitInput) ?? 0
    }
    
    /*
     
     take the current input segment and establish it as the base
     take the current output segment and establish it as the multiplier
     create a variable that is the base times multiplier
     show variable output
     */
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("How many?")) {
                    TextField("Enter quantity", text: $unitInput)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Input Unit Type")) {
                    Picker("Unit Type", selection: $unitInputType) {
                        ForEach(0..<unitInputTypes.count) {
                            Text("\(self.unitInputTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output Unit Type")) {
                    Picker("Unit Type", selection: $unitOutputType) {
                        ForEach(0..<unitOutputTypes.count) {
                            Text("\(self.unitOutputTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Converted Length")) {
                    Text("\(convertedQuantity, specifier: "%.3f") meters")
                }

                
            }
            .navigationBarTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

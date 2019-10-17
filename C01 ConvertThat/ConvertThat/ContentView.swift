//
//  ContentView.swift
//  ConvertThat
//
//  Created by Jason Rueckert on 10/14/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //Give the user input TextField a default of 1, & set the segmentedPickers to the middle selection
    @State private var unitInput = "1"
    @State private var unitInputType = 3
    @State private var unitOutputType = 3
    
    //An array defines the choices for the segmentedPicker
    var lengthUnits = ["mm", "cm", "m", "km", "inch", "feet", "yard", "mile"]

    
    //The calculated property below converts the input quantity & unit to mm and then to the desired conversion unit
    var convertedOutputType: Double {
        let startUnit = lengthUnits[unitInputType]
        var startFactor: Double = 1
        
        let endUnit = lengthUnits[unitOutputType]
        var endFactor: Double = 1
        
        switch startUnit {
        case "cm":
            startFactor = 10
        case "m":
            startFactor = 100
        case "km":
            startFactor = 1000
        case "inch":
            startFactor = 25.4
        case "feet":
            startFactor = 25.4 * 12
        case "yard":
            startFactor = 25.4 * 12 * 3
        case "mile":
            startFactor = 25.4 * 12 * 5280
        default:
            startFactor = 1
        }
        
        let mmConversion = startFactor * Double(Double(unitInput) ?? 0)
        
        switch endUnit {
        case "cm":
            endFactor = 1/10
        case "m":
            endFactor = 1/100
        case "km":
            endFactor = 1/1000
        case "inch":
            endFactor = 1/25.4
        case "feet":
            endFactor = 1/(25.4 * 12)
        case "yard":
            endFactor = 1/(25.4 * 12 * 3)
        case "mile":
            endFactor = 1/(25.4 * 12 * 5280)
        default:
            endFactor = 1
        }
        
        return mmConversion * endFactor
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit Type")) {
                    Picker("Unit Type", selection: $unitInputType) {
                        ForEach(0 ..< lengthUnits.count) {
                            Text("\(self.lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("How many?")) {
                    TextField("Enter quantity", text: $unitInput)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Output Unit Type")) {
                    Picker("Unit Type", selection: $unitOutputType) {
                        ForEach(0..<lengthUnits.count) {
                            Text("\(self.lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Converted Length")) {
                    Text("\(convertedOutputType, specifier: "%.5f")")
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

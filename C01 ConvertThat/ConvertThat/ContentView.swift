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
    
    var lengthUnits = ["mm", "cm", "m", "km", "inch", "feet", "yard", "mile"]

    var convertedOutputType: Double {
        let startUnit = lengthUnits[unitInputType]
        var startingMultiplier: Double = 1
        
        let endUnit = lengthUnits[unitOutputType]
        var endingMultiplier: Double = 1
        
        switch startUnit {
        case "cm":
            startingMultiplier = 10
        case "m":
            startingMultiplier = 100
        case "km":
            startingMultiplier = 1000
        case "inch":
            startingMultiplier = 25.4
        case "feet":
            startingMultiplier = 25.4 * 12
        case "yard":
            startingMultiplier = 25.4 * 12 * 3
        case "mile":
            startingMultiplier = 25.4 * 12 * 5280
        default:
            startingMultiplier = 1
        }
        
        let mmConversion = startingMultiplier * Double(Double(unitInput) ?? 0)
        
        switch endUnit {
        case "cm":
            endingMultiplier = 1/10
        case "m":
            endingMultiplier = 1/100
        case "km":
            endingMultiplier = 1/1000
        case "inch":
            endingMultiplier = 1/25.4
        case "feet":
            endingMultiplier = 1/(25.4 * 12)
        case "yard":
            endingMultiplier = 1/(25.4 * 12 * 3)
        case "mile":
            endingMultiplier = 1/(25.4 * 12 * 5280)
        default:
            endingMultiplier = 1
        }
        
        return mmConversion * endingMultiplier
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

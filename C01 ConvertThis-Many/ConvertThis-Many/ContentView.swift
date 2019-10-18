//
//  ContentView.swift
//  ConvertThis-Many
//
//  Created by Jason Rueckert on 10/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputVar = ""
    @State private var inputUnit = 3
    @State private var outputUnit = 3
    @State private var isShowing = false
    
    let convertType = ["Length", "Temperature"]
    
    let lengthType = ["mm", "cm", "m", "km", "inch", "feet", "yard", "mile"]
    
    var convertedUnits: Double {
        let startUnit = lengthType[inputUnit]
        var startFactor: Double = 1
        
        let endUnit = lengthType[outputUnit]
        var endFactor: Double = 1
        
        switch startUnit {
        case "cm":
            startFactor = 10
        case "m":
            startFactor = 100
        case "km":
            startFactor = 1000
        case "inch":
            startFactor = 12.5
        case "feet":
            startFactor = 12.5 * 12
        case "yard":
            startFactor = 12.5 * 12 * 3
        case "mile":
            startFactor = 12.5 * 12 * 5280
        default:
            startFactor = 1
        }
        
        let mmConversion = startFactor * Double(Double(inputVar) ?? 0)
        
        switch endUnit {
        case "cm":
            endFactor = 1/10
        case "m":
            endFactor = 1/100
        case "km":
            endFactor = 1/1000
        case "inch":
            endFactor = 1/12.5
        case "feet":
            endFactor = 1/(12.5 * 12)
        case "yard":
            endFactor = 1/(12.5 * 12 * 3)
        case "mile":
            endFactor = 1/(12.5 * 12 * 5280)
        default:
            endFactor = 1
        }
        
        return mmConversion * endFactor
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Length units", selection: $inputUnit) {
                        ForEach(0 ..< lengthType.count) {
                            Text("\(self.lengthType[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    TextField("Length to convert", text: $inputVar)
                }
                Section {
                    Picker("Length units", selection: $outputUnit) {
                        ForEach(0 ..< lengthType.count) {
                            Text("\(self.lengthType[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(self.convertedUnits, specifier: "%.5f")")
                }
            }
        .navigationBarTitle("Convert This")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

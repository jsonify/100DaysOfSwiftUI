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
    @State private var m = 0.0
    @State private var km = 0.0
    @State private var ft = 0.0
    @State private var yard = 0.0
    @State private var mile = 0.0
    
    @State private var cm = 0
    @State private var mm = 0
    @State private var inch = 0
    
    @State private var unitInputType = 0
    @State private var unitOutputType = 0
    
    let unitInputTypes = ["Meters", "Km", "Ft", "Yards", "Miles"]
    let unitOutputTypes = ["Meters", "Km", "Ft", "Yards", "Miles"]
    
//    func convertAmountMM(amount: ) {
//        if(unitInputType == 0) {
//            km = amount * 1000
//            ft = amount * 3.28084
//            yard = amount * 1.093613
//            mile = amount * 0.000621
//        }
//    }
    
    var convertedAmount: Double {
        let quantity = Double(unitInput)
        return 0
    }
    
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
                    Text("\(convertedAmount, specifier: "%.3f") units")
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

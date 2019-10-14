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
    @State private var m = 0
    @State private var cm = 0
    @State private var mm = 0
    @State private var yard = 0
    @State private var ft = 0
    @State private var inch = 0
    @State private var km = 0
    @State private var mile = 0
    
    @State private var unitType = 0
    
    let unitTypes = ["Meters", "Km", "Ft", "Yards", "Miles"]
//    func convertAmount(amount: Double)
    
    var convertToMM: Double {
        
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input quantity")) {
                    TextField("Enter quantity", text: $unitInput)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Unit Type")) {
                    Picker("Unit Type", selection: $unitType) {
                        ForEach(0..<unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Meters")) {
                    Text("\(m) m")
                }
                Section(header: Text("Kilometers")) {
                    Text("\(km) km")
                }
                Section(header: Text("Feet")) {
                    Text("\(ft) ft")
                }
                Section(header: Text("Yards")) {
                    Text("\(yard) y")
                }
                Section(header: Text("Miles")) {
                    Text("\(mile) miles")
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

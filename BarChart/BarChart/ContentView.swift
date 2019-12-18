//
//  ContentView.swift
//  BarChart
//
//  Created by Jason on 12/18/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var pickerSelectedItem = 0
    @State private var dataPoints: [[CGFloat]] = [
        [50, 100, 150],
        [150, 100, 50],
        [100, 50, 150]
    ]
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Bar Chart")
                    .font(.system(size: 28))
                    .fontWeight(.medium)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Weekly").tag(0)
                    Text("Monthly").tag(1)
                    Text("Yearly").tag(2)
                }
            .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                HStack(spacing: 8) {
                    BarView(value: dataPoints[pickerSelectedItem][0], week: "D")
                    BarView(value: dataPoints[pickerSelectedItem][1], week: "D")
                    BarView(value: dataPoints[pickerSelectedItem][2], week: "D")
                }
                .padding(.top, 24)
                .animation(.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

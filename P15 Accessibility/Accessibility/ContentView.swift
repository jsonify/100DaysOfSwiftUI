//
//  ContentView.swift
//  Accessibility
//
//  Created by Jason on 12/19/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("Identifying views with useful labels", destination: IdentitfyingWithUsefulLabels())
                    NavigationLink("Hiding and grouping accessibility data", destination: HidingGroupingAccessibilityData())
                    NavigationLink("Reading the value of controls", destination: ReadingValueOfControls())
                }
                
                Section(header: Text("Application")) {
                    NavigationLink("Accessibility App", destination: Application())
                }
            }
        .navigationBarTitle("P15 - Accessibility")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

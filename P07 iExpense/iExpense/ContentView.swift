//
//  ContentView.swift
//  iExpense
//
//  Created by Jason on 11/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basics")) {
                    NavigationLink("Using @State for single view", destination: UsingState())
                    NavigationLink("Using @ObservedObject for sharing", destination: ObservableObjects())
                }
            }
            .navigationBarTitle("P07 - iExpense")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

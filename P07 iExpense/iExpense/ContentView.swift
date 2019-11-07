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
                    NavigationLink("Showing and Hiding sheets", destination: ShowingHidingViews())
                    NavigationLink("Deleting items using onDelete()", destination: DeletingItems())
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

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
                    NavigationLink("Storing user settings with UserDefaults", destination: StoringUserDefaults())
                    NavigationLink("Archiving Swift objects with Codable", destination: ArchivingWithCodable())
                }
                Section(header: Text("Main")) {
                    NavigationLink("iExpense Application", destination: Application())
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

//
//  ContentView.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basics")) {
                    NavigationLink("Resizing images to fit the screen using GeometryReader", destination: UsingGeometryReader())
                    NavigationLink("Using ScrollView to working with scrolling data", destination: UsingScrollView())
                }
                
                Section(header: Text("Main")) {
                    NavigationLink("Moonshot Application", destination: Application())
                }
            }
        .navigationBarTitle("P08 - Moonshot")
        }
        .environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}

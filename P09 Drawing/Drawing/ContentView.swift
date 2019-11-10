//
//  ContentView.swift
//  Drawing
//
//  Created by Jason on 11/9/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("Creating custom paths with SwiftUI", destination: CustomPaths())
                    
                }
                
                Section(header: Text("Main")) {
                    NavigationLink("Drawing Application", destination: Application())
                }
            }
        .navigationBarTitle("P09 - Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

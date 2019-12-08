//
//  ContentView.swift
//  Instafilter
//
//  Created by Jason on 12/7/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("How property wrappers become structs", destination: PropertyWrappersStructs())
                    NavigationLink("Creating custom bindings in SwiftUI", destination: CustomBindings())
                }
                
                Section(header: Text("Main")) {
                    NavigationLink("Application", destination: Application())
                }
            }
        .navigationBarTitle("Instafilter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

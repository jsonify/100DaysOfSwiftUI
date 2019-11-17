//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Jason on 11/14/19.
//  Copyright © 2019 Jason. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("Adding Codable conformance for @Published properties", destination: AtPublishedProperties())
                    NavigationLink("Sending and receiving Codable data with URLSession and SwiftUI", destination: UsingURLSession())
                    NavigationLink("Validating and disabling forms", destination: ValidatingDisablingForms())
                }
                
                Section(header: Text("Main")) {
                    NavigationLink("Application: Cupcake Corner", destination: Application())
                }
            }
        .navigationBarTitle("P10 - Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

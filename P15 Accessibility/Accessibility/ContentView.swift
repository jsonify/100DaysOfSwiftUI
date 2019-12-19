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
                }
                
                Section(header: Text("Application")) {
                    NavigationLink("Accessibility App", destination: Application())
                }
            }
        .navigationBarTitle("P14 - Bucket List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

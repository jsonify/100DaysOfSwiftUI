//
//  ContentView.swift
//  BucketList
//
//  Created by Jason on 12/13/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("Comparable for custom types", destination: UsingComparable())
                }
                
                Section(header: Text("Application")) {
                    NavigationLink("BucketList", destination: Application())
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

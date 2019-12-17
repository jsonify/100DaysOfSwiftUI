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
                    NavigationLink("Writing data to the documents directory", destination: WritingDataToDocumentsDir())
                    NavigationLink("Switching view states with enums", destination: SwitchingViewsWithEnumStates())
                    NavigationLink("Integrating MapKit with SwiftUI ", destination: IntegratingMapKit())
                    NavigationLink("Using Touch ID and Face ID with SwiftUI", destination: TouchIDFaceID())
                    NavigationLink("Advanced MKMapView with SwiftUI", destination: AdvancedMapKit())
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

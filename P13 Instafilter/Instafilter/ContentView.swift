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
                    NavigationLink("Showing multiple options with ActionSheet", destination: MultipleOptionsActionSheet())
                    NavigationLink("Integrating Core Image with SwiftUI", destination: IntegratingCoreImage())
                    NavigationLink("Wrapping a UIViewController in a SwiftUI view and Using coordinators to manage SwiftUI view controllers", destination: WrappingUIViewController())
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

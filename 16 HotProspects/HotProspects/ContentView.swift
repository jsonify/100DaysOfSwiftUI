//
//  ContentView.swift
//  HotProspects
//
//  Created by Jason on 12/26/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("Reading custom values from the environment with @EnvironmentObject", destination: UsingEnvironmentObject())
                    NavigationLink("Creating tabs with TabView and tabItem()", destination: CreatingTabs())
                    NavigationLink("Understanding Swift’s Result type", destination: UsingResultType())
                    NavigationLink("Manually publishing ObservableObject changes", destination: ManuallyPublishing())
                    NavigationLink("Controlling image interpolation in SwiftUI", destination: ControllingImageInterpolation())
                    NavigationLink("Creating context menus", destination: ContextMenus())
                    NavigationLink("Scheduling local notifications", destination: SchedulingLocalNotifications())
                    NavigationLink("Adding Swift package dependencies in Xcode", destination: UsingSwiftPackageManager())
    
                }
                
                Section(header: Text("Main")) {
                    NavigationLink("Application", destination: Application())
                }
            }
        .navigationBarTitle("Hot Prospects")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

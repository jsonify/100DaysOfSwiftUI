//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Jason on 11/22/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("Why does .self work for ForEach?", destination: UnderstandingForEach())
                    NavigationLink("Creating NSManagedObject subclasses", destination: CreatingNSManagedObjects())
                    NavigationLink("Conditional saving of NSManagedObjectContext", destination: NSManagedObjectContext())
                    NavigationLink("Ensuring Core Data objects are unique using constraints", destination: UsingCoreDataConstraints())
                }
                
                Section(header: Text("Main")) {
                    NavigationLink("Core Data Application", destination: Application())
                }
            }
            .navigationBarTitle("P12 - Core Data Project")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

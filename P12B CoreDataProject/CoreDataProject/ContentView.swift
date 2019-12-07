//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Jason on 12/4/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var lastNameFilter = "A"
    
    let schools: [School] = Bundle.main.decode("wa_schools.json")
//    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        VStack {
            List(schools) { school in
                HStack {
                    NavigationLink(desitination: SchoolView(schoolInfo: [SchoolView.SchoolInfo]))
                    Text(school.schoolName)
                    Spacer()
                    Text("\(school.schoolLevel) school")
                        .font(.subheadline)
                }
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheenan"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
//
//            Button("Show A") {
//                self.lastNameFilter = "A"
//            }
//
//            Button("Show S") {
//                self.lastNameFilter = "S"
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

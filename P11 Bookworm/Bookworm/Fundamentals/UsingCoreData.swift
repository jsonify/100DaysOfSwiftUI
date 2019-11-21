//
//  UsingCoreData.swift
//  Bookworm
//
//  Created by Jason on 11/21/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

/*
 Retrieving information from Core Data is done using a fetch request:
 - we describe what we want
 - how it should sorted
 - whether any filters should be used
 and Core Data sends back all the matching data.
 
 We need to make sure that this fetch request stays up to date over time, so that as students are created or removed our UI stays synchronized.
 */
struct UsingCoreData: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>

    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            
            Button("Add") {
                let firstNames = ["Anh", "Rolf", "Fred", "Bonnie", "Jordan"]
                let lastNames = ["S'mom", "Doom", "Bammer", "Coned"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? self.moc.save()
            }
        }
    }
}

struct UsingCoreData_Previews: PreviewProvider {
    static var previews: some View {
        UsingCoreData()
    }
}

//
//  UnderstandingForEach.swift
//  CoreDataProject
//
//  Created by Jason on 11/22/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct UnderstandingForEach: View {
    let students = [Student(name: "Harry Poter"), Student(name: "Hermione Granger")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct UnderstandingForEach_Previews: PreviewProvider {
    static var previews: some View {
        UnderstandingForEach()
    }
}

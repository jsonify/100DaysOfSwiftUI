//
//  ContentView.swift
//  WeSplit
//
//  Created by Jason Rueckert on 10/11/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermoine", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0..<students.count) {
                Text(self.students[$0])
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

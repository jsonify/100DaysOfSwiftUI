//
//  ContentView.swift
//  iExpense
//
//  Created by Jason on 11/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

class User1: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
    
}

struct ObservableObjects: View {
//@State private var user = User()
    @ObservedObject var user = User1()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ObservableObjects_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjects()
    }
}

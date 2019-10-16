//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jason Rueckert on 10/15/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button was tapped")
        }) {
            HStack {
                Image(systemName: "pencil")
                    Text("Edit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

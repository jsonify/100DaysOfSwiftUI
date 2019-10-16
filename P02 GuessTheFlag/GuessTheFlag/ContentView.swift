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
        VStack {
            HStack {
                Text("x")
                Text("x")
                Text("x")
            }
            HStack {
                Text("x")
                Text("x")
                Text("x")
            }
            HStack {
                Text("x")
                Text("x")
                Text("x")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

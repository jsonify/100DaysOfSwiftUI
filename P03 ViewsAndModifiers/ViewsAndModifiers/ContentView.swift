//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jason Rueckert on 10/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View { Text("What the heck?") }
    let motto2 = Text("Oh no she didn't")
    
    var body: some View {
        VStack {
            motto1
            motto2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jason Rueckert on 10/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jason Rueckert on 10/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct CapsuleType: View {
    var text: String
    
    var body: some View {
        Text(text)
        .font(.largeTitle)
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .clipShape(Capsule())
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            CapsuleType(text: "new")
            
            CapsuleType(text: "boom")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

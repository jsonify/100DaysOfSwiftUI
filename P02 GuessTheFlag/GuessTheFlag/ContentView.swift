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
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//            RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .bottomTrailing, startRadius: 20, endRadius: 1000)
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

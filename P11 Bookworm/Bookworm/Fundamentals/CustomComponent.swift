//
//  CustomComponent.swift
//  Bookworm
//
//  Created by Jason on 11/19/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

// create a new kind of button: one that stays down when pressed.

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColores = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColores), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct CustomComponent: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            //  we’re passing in the binding itself, not the Boolean inside it.
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct CustomComponent_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponent()
    }
}

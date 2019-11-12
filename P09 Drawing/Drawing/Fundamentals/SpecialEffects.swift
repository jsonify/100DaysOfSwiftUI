//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Jason on 11/11/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct SpecialEffects: View {
    @State private var selected = 1
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        TabView(selection: $selected) {
            /*
             Using multiply below with a solid color applies a really common tint effect: blacks stay black (because they have the color value of 0, so regardless of what you put on top multiplying by 0 will produce 0), whereas lighter colors become various shades of the tint.
             */
            Image("PaulHudson")
                .colorMultiply(.red)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Multiply")
            }
            .tag(0)
            
            /*
             Another popular effect is called screen, which does the opposite of multiply: it inverts the colors, performs a multiply, then inverts them again, resulting in a brighter image rather than a darker image.
             */
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(red: 1, green: 0, blue: 0))
                        .frame(width: 200 * amount)
                        .offset(x: -50, y: -80)
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(Color(red: 0, green: 1, blue: 0))
                        .frame(width: 200 * amount)
                        .offset(x: 50, y: -80)
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(Color(red: 0, green: 0, blue: 1))
                        .frame(width: 200 * amount)
                        .blendMode(.screen)
                }
                .frame(width: 300, height: 300)
                
                Slider(value: $amount)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .tabItem {
                Image(systemName: "2.square.fill")
                Text("Screen")
            }
            .tag(1)
            
            /*
             With the following code, having the slider at 0 means the image is blurred and colorless, but as you move the slider to the right it gains color and becomes sharp – all rendered at lightning-fast speed.
             */
            VStack {
                Image("PaulHudson")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
                .frame(width: 300, height: 300)
                
                Slider(value: $amount)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .tabItem {
                Image(systemName: "3.square.fill")
                Text("Blur/Saturation")
            }
            .tag(2)
        }
    }
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}

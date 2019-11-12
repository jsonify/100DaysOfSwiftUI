//
//  DrawingGroup.swift
//  Drawing
//
//  Created by Jason on 11/11/19.
//  Copyright © 2019 Jason. All rights reserved.
//

/*
 We can fix rendering complex views by applying a new modifier, called drawingGroup(). This tells SwiftUI it should render the contents of the view into an off-screen image before putting it back onto the screen as a single rendered output, which is signficantly faster. Behind the scenes this is powered by Metal, which is Apple’s framework for working directly with the GPU for extremely fast graphics.
 
 Important: The drawingGroup() modifier is helpful to know about and to keep in your arsenal as a way to solve performance problems when you hit them, but you should not use it that often. Adding the off-screen render pass might slow down SwiftUI for simple drawing, so you should wait until you have an actual performance problem before trying to bring in drawingGroup().
 */

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                .inset(by: CGFloat(value))
//                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
                .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                    self.color(for: value, brightness: 1),
                    self.color(for: value, brightness: 0.5)
                ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
    .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct DrawingGroup: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
            .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct DrawingGroup_Previews: PreviewProvider {
    static var previews: some View {
        DrawingGroup()
    }
}

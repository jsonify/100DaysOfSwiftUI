//
//  AnimatableData.swift
//  Drawing
//
//  Created by Jason on 11/12/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

/*
 What’s happening here is quite complex: when we use withAnimation(), SwiftUI immediately changes our state property to its new value, but behind the scenes it’s also keeping track of the changing value over time as part of the animation. As the animation progresses, SwiftUI will set the animatableData property of our shape to the latest value, and it’s down to us to decide what that means – in our case we assign it directly to insetAmount, because that’s the thing we want to animate.
 
 */
struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct AnimatableData: View {
    @State private var insetAmount: CGFloat = 50
    var body: some View {
        /*
         Remember, SwiftUI evaluates our view state before an animation was applied and then again after. It can see we originally had code that evaluated to Trapezoid(insetAmount: 50), but then after a random number was chosen we ended up with (for example) Trapezoid(insetAmount: 62). So, it will interpolate between 50 and 62 over the length of our animation, each time setting the animatableData property of our shape to be that latest interpolated value – 51, 52, 53, and so on, until 62 is reached.
         */
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation {
                self.insetAmount = CGFloat.random(in: 10...90)
                }
        }
    }
}

struct AnimatableData_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableData()
    }
}

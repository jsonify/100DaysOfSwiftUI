//
//  UsingAnimatablePair.swift
//  Drawing
//
//  Created by Jason on 11/12/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

/*
 Here, though, there are two catches:

 1. We have two properties that we want to animate, not one.
 2. Our row and column properties are integers, and SwiftUI can’t interpolate integers.
 To resolve the first problem we’re going to use a new type called AnimatablePair. As its name suggests, this contains a pair of animatable values, and because both its values can be animated the AnimatablePair can itself be animated. We can read individual values from the pair using .first and .second.

 To resolve the second problem we’re just going to do some type conversion: we can convert a Double to an Int just by using Int(someDouble), and go the other way by using Double(someInt).
 */

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct UsingAnimatablePair: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 16
                }
        }
    }
}

struct UsingAnimatablePair_Previews: PreviewProvider {
    static var previews: some View {
        UsingAnimatablePair()
    }
}

//
//  UsingInsettableShape.swift
//  Drawing
//
//  Created by Jason on 11/11/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct UsingInsettableShape: View {
    var body: some View {
        //        Circle()
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 40)
    }
}

struct UsingInsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        UsingInsettableShape()
    }
}

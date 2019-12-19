//
//  BarView.swift
//  BarChart
//
//  Created by Jason on 12/18/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct BarView: View {
    var value: CGFloat = 0
    var week: String = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 30, height: value)
                    .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.6609053938, blue: 0.662745098, alpha: 1)))
                Capsule()
                .frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(week)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}

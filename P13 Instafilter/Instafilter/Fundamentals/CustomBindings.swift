//
//  CustomBindings.swift
//  Instafilter
//
//  Created by Jason on 12/7/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct CustomBindings: View {
        @State private var blurAmount: CGFloat = 0 {
            didSet {
                print("New value is \(blurAmount)")
            }
        }
    
    var body: some View {
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmount
            },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )
        
        return VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .blur(radius: blurAmount)
            
            Slider(value: blur, in: 0...20)
        }
    }
}

struct CustomBindings_Previews: PreviewProvider {
    static var previews: some View {
        CustomBindings()
    }
}

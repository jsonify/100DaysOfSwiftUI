//
//  ControllingImageInterpolation.swift
//  HotProspects
//
//  Created by Jason on 1/1/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ControllingImageInterpolation: View {
    var body: some View {
        Image("example")
            // interpolation() modifier that lets us control how pixel blending is applied. There are multiple levels to this, but realistically we only care about one: .none. This turns off image interpolation entirely, so rather than blending pixels they just get scaled up with sharp edges.
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ControllingImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ControllingImageInterpolation()
    }
}

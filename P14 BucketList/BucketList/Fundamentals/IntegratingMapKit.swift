//
//  IntegratingMapKit.swift
//  BucketList
//
//  Created by Jason on 12/13/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct IntegratingMapKit: View {
    var body: some View {
        MapViewFund()
            .edgesIgnoringSafeArea(.all)
    }
}

struct IntegratingMapKit_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingMapKit()
    }
}

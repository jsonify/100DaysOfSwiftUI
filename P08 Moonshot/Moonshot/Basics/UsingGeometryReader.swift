//
//  UsingGeometryReader.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct UsingGeometryReader: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("superwings")
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        }
        .environment(\.colorScheme, .light)
    }
}

struct UsingGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        UsingGeometryReader()
        .environment(\.colorScheme, .dark)
    }
}

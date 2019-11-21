//
//  UsingAnyView.swift
//  Bookworm
//
//  Created by Jason on 11/19/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct UsingAnyView: View {
    //    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var sizeClass

        
        var body: some View {
            if sizeClass == .compact {
                return AnyView(VStack {
                    Text("Active size class:")
                    Text("COMPACT")
                }
                .font(.largeTitle))
            } else {
                return AnyView(HStack {
                    Text("Active size class:")
                    Text("REGULAR")
                }
                .font(.largeTitle))
            }
        }
    }
    
    struct UsingAnyView_Previews: PreviewProvider {
        static var previews: some View {
            UsingAnyView()
        }
}

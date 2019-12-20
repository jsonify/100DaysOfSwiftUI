//
//  HidingGroupingAccessibilityData.swift
//  Accessibility
//
//  Created by Jason on 12/19/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct HidingGroupingAccessibilityData: View {
    var body: some View {
        ZStack {
            Image(decorative: "jsnProfilePicture")
                .accessibility(hidden: true)
                VStack {
                    Text("Your score is")
                    Text("1000")
                        .font(.title)
                }
                .accessibilityElement(children: .ignore)
                .accessibility(label: Text("Your score is 1000"))
        }
    }
}

struct HidingGroupingAccessibilityData_Previews: PreviewProvider {
    static var previews: some View {
        HidingGroupingAccessibilityData()
    }
}

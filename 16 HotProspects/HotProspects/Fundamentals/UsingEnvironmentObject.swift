//
//  UsingEnvironmentObject.swift
//  HotProspects
//
//  Created by Jason on 12/26/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct UsingEnvironmentObject: View {
    let user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct UsingEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        UsingEnvironmentObject()
    }
}

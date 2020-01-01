//
//  ManuallyPublishing.swift
//  HotProspects
//
//  Created by Jason on 1/1/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ManuallyPublishing: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is \(updater.value)")
    }
    
    
}

class DelayedUpdater: ObservableObject {
//    @Published var value = 0
    
    // removing the @Published
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManuallyPublishing_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublishing()
    }
}

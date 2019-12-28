//
//  CreatingTabs.swift
//  HotProspects
//
//  Created by Jason on 12/26/19.
//  Copyright © 2019 Jason. All rights reserved.
//

/*
 SwiftUI also allows us to control the current view programmatically using state. This takes four steps:
 */

import SwiftUI

struct CreatingTabs: View {
    // 1. we need some state to track the current tab
    @State private var selectedTab = 0
    
    var body: some View {
        // 3. we need to bind the selection of the TabView to $selectedTab
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                // 2. we need to modify that somewhere, which will ask SwiftUI to switch tabs
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                // 4. we can attach a unique identifier to each view, and use that for the selected tab. These identifiers are called tags, and are attached using the tag() modifier
                .tag(0)
            
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
            }
            .tag(1)
        }
    }
}

struct CreatingTabs_Previews: PreviewProvider {
    static var previews: some View {
        CreatingTabs()
    }
}

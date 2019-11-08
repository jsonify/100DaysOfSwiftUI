//
//  UsingNavigationLink.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

// NavigationLink is for showing details about the user's selection, like you're digging deeper into a topic

// sheet() is for showing unrelated content, such as settings or a compose window

struct UsingNavigationLink: View {
    var body: some View {
        NavigationView {
//            VStack {
//                // Create a a tappable destination from a text view
//                NavigationLink(destination: Text("Detail View")) {
//                    // contents of the "Detail View"
//                    Text("Hello World")
//                }
//            }
            
//            Using a List, creates list of rows that can be tapped to show a detail view
            List(0..<100) { row in
                // Create a a tappable destination from a text view
                NavigationLink(destination: Text("Detail \(row)")) {
                    // contents of the "Detail View"
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct UsingNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        UsingNavigationLink()
    }
}

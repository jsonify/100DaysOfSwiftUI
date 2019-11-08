//
//  UsingScrollView.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

// create a simple wrapper to demonstrate how views get created immediately when inside a Scroll View
struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct UsingScrollView: View {
    var body: some View {
// create list of text views lazily, only when needed
//        List {
//                ForEach(0..<100) {
////                    Text("Item \($0)")
////                        .font(.title)
//                    CustomText("Item \($0)")
//                    .font(.title)
//                }
//            }
        
// create a scrolling list of 100 text views
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        ForEach(0..<100) {
                            CustomText("Item \($0)")
                            .font(.title)
                        }
                    }
                // to tap and drag anywhere on the screen
            .frame(maxWidth: .infinity)
        }
    }
}

struct UsingScrollView_Previews: PreviewProvider {
    static var previews: some View {
        UsingScrollView()
    }
}

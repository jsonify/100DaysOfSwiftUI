//
//  MultipleOptionsActionheet.swift
//  Instafilter
//
//  Created by Jason on 12/7/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct MultipleOptionsActionSheet: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .frame(width: 300, height: 300)
        .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                .default(Text("Red")) { self.backgroundColor = .red },
                .default(Text("Green")) { self.backgroundColor = .green },
                .default(Text("Blue")) { self.backgroundColor = .blue },
                .cancel()
            ])
        }
    }
}

struct MultipleOptionsActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        MultipleOptionsActionSheet()
    }
}

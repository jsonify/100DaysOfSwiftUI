//
//  ContextMenus.swift
//  HotProspects
//
//  Created by Jason on 1/1/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ContextMenus: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)

            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(action: {
                        self.backgroundColor = .red
                    }) {
                        Text("Red")
                        Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.red)
                    }

                    Button(action: {
                        self.backgroundColor = .green
                    }) {
                        Text("Green")
                        Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.red)
                    }

                    Button(action: {
                        self.backgroundColor = .blue
                    }) {
                        Text("Blue")
                    }
                }
        }
    }
}

struct ContextMenus_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenus()
    }
}

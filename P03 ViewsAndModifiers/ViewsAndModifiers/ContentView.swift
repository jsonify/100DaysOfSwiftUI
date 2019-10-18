//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jason Rueckert on 10/17/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        HStack {
                            Image(systemName: "\(row * 4 + column).circle")
                            Text("R\(row) C\(column)")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Text("R\(row), C\(col)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Drawing
//
//  Created by Jason on 11/9/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fundamentals")) {
                    NavigationLink("Creating custom paths with SwiftUI", destination: CustomPaths())
                    NavigationLink("Paths vs shapes in SwiftUI", destination: PathsVsShapes())
                    NavigationLink("Adding strokeBorder() support with InsettableShape", destination: UsingInsettableShape())
                    NavigationLink("Transforming shapes using CGAffineTransform and even-odd fills", destination: UsingCGAffineTransform())
                    NavigationLink("Creative borders and fills using ImagePaint", destination: UsingImagePaint())
                    NavigationLink("Enabling high-performance Metal rendering with drawingGroup()", destination: DrawingGroup())
                    NavigationLink("Special effects in SwiftUI: blurs, blending, and more", destination: SpecialEffects())
                }
                
                Section(header: Text("Main")) {
                    NavigationLink("Drawing Application", destination: Application())
                }
            }
        .navigationBarTitle("P09 - Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

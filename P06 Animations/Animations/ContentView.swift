//
//  ContentView.swift
//  Animations
//
//  Created by Jason on 11/4/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomLeading)
            .frame(width: 300, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(dragAmount)
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { _ in
                    withAnimation(.spring()) {
                        
                        self.dragAmount = .zero
                        }
                    
            }
        )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

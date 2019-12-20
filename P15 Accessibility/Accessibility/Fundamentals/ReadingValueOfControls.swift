//
//  ReadingValueOfControls.swift
//  Accessibility
//
//  Created by Jason on 12/20/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ReadingValueOfControls: View {
    @State private var estimate = 25.0
    @State private var rating = 3
    
    var body: some View {
        VStack {
            Text("Estimate: \(estimate)")
            Slider(value: $estimate, in: 0...50)
                .padding()
                // adding a custom read out for the values
                .accessibility(value: Text("\(Int(estimate))"))
            
            Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
                // adding a custom read out for the values
                .accessibility(value: Text("\(rating) out of 5"))
        }
    }
}

struct ReadingValueOfControls_Previews: PreviewProvider {
    static var previews: some View {
        ReadingValueOfControls()
    }
}

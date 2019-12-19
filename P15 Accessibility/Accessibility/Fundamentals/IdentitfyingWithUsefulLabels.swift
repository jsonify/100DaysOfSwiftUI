//
//  IdentitfyingWithUsefulLabels.swift
//  Accessibility
//
//  Created by Jason on 12/19/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct IdentitfyingWithUsefulLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    // Added for accessibility image labels
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            // Adding the accessibility modifier, VoiceOver reads a useful description of the image’s contents, and also makes users aware the image is also a button.
            .accessibility(label: Text(labels[selectedPicture]))
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
            .onTapGesture {
                self.selectedPicture = Int.random(in: 0...3)
        }
    }
}

struct IdentitfyingWithUsefulLabels_Previews: PreviewProvider {
    static var previews: some View {
        IdentitfyingWithUsefulLabels()
    }
}

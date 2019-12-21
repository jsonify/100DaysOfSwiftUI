//
//  RatingView.swift
//  Bookworm
//
//  Created by Jason on 11/21/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

/*
 @Binding is particularly useful when building custom UI components, because its ability to share data between views is just so useful.
 */

struct RatingView: View {
    @Binding var rating: Int
    
    // What label should be placed before the rating (default: an empty string)
    var label = ""
    // The maximum integer rating (default: 5)
    var maximumRating = 5
    
    // The off and on images, which dictate the images to use when the star is highlighted or not (default: nil for the off image, and a filled star for the on image; if we find nil in the off image we’ll use the on image there too)
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    // The off and on colors, which dictate the colors to use when the star is highlighted or not (default: gray for off, yellow for on)
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                }
                // Fixing Bookworm from P15 - Accessibility
                // add a meaningful label for each star
                .accessibility(label: Text("\(number == 1 ? "1 star" : "\(number) stars")"))
                // remove the .isImage trait, because it really doesn’t matter that these are images
                .accessibility(removeTraits: .isImage)
                // tell the system that each star is actually a button, so users know it can be tapped.
                // And make VoiceOver do an even better job by adding a second trait, .isSelected, if the star is already highlighted.
                .accessibility(addTraits: number > 1 ? .isButton : [.isButton, .isSelected])
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        // View_Previews struct doesn’t pass in a binding to use. SwiftUI has a specific and simple solution called constant bindings. These are bindings that have fixed values.
        RatingView(rating: .constant(4))
    }
}

//
//  WrappingUIViewController.swift
//  Instafilter
//
//  Created by Jason on 12/9/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

/*
 use UIViewControllerRepresentable to wrap a UIKit view controller so that it can be used inside SwiftUI, in particular focusing on UIImagePickerController
 We did this by creating the ImagePicker.swift file then adding the proper struct conformity there
 */

struct WrappingUIViewController: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
            .resizable()
            .scaledToFit()
            
            Button("Add image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
 
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct WrappingUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrappingUIViewController()
    }
}

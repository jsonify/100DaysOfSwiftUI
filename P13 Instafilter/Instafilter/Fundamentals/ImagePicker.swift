//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Jason on 12/9/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

// This struct is now configured to talk to the Coordinator class when something interesting happens.

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // SwiftUI’s @Binding property wrapper allows us to create a binding from ImagePicker up to whatever created it. This means we can set the binding value in our image picker and have it actually update a value being stored somewhere else – in ContentView, for example.
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // we aren't needing to use this right now, so no code is needed
    }
    // 1. add the typealias first, then let Xcode fix by adding stubs
    // 2. the above methods are then generated and are actually enough for Swift to figure out the view controller type so you can delete the typealias line
//    typealias UIViewControllerType = UIImagePickerController
    
    
}

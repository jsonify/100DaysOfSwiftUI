//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Jason on 12/9/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        // we aren't needing to use this right now, so no code is needed
    }
    // 1. add the typealias first, then let Xcode fix by adding stubs
    // 2. the above methods are then generated and are actually enough for Swift to figure out the view controller type so you can delete the typealias line
//    typealias UIViewControllerType = UIImagePickerController
    
    
}

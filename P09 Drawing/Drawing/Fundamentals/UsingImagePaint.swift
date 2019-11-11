//
//  UsingImagePaint.swift
//  Drawing
//
//  Created by Jason on 11/11/19.
//  Copyright © 2019 Jason. All rights reserved.
//
/*
 SwiftUI gives us a dedicated type that wraps images in a way that we have complete control over how they should be rendered, which in turn means we can use them for borders and fills without problem.

 The type is called ImagePaint, and it’s created using one to three parameters. At the very least you need to give it an Image to work with as its first parameter, but you can also provide a rectangle within that image to use as the source of your drawing specified in the range of 0 to 1 (the second parameter), and a scale for that image (the third parameter). Those second and third parameters have sensible default values of “the whole image” and “100% scale”, so you can sometimes ignore them.
 
 ImagePaint will automatically keep tiling its image until it has filled its area – it can work with backgrounds, strokes, borders, and fills of any size.
 */

import SwiftUI

struct UsingImagePaint: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .frame(width: 300, height: 300)
////            .background(Color.red)
////            .border(Color.red, width: 30)
//            .border(ImagePaint(image: Image("Example"), sourceRect:CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
    }
}

struct UsingImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        UsingImagePaint()
    }
}

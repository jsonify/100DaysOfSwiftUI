//
//  WritingDataToDocumentsDir.swift
//  BucketList
//
//  Created by Jason on 12/13/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct WritingDataToDocumentsDir: View {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    var body: some View {
        Text("Hello World")
            .onTapGesture {
                let str = "Test message"
                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
}

struct WritingDataToDocumentsDir_Previews: PreviewProvider {
    static var previews: some View {
        WritingDataToDocumentsDir()
    }
}

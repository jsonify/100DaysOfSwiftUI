//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Jason on 12/13/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

extension FileManager {
    var documentDirectoryPath: URL {
        guard let path = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Could not find documents directory")
        }
        
        return path
    }
    // Making the decode generic give flexibility for the type
    func readDocument<T: Codable>(from file: String) -> T {
        let path = documentDirectoryPath.appendingPathExtension(file)
        
        guard let data = try? Data(contentsOf: path) else {
            fatalError("Could not read contents of \(path)")
        }
        
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return decodedData
    }
    
    func writeDocument<T: Codable>(_ data: T, to file: String) -> Bool {
        let path = documentDirectoryPath.appendingPathComponent(file).path
        let encoder = JSONEncoder()
        
        guard let encodedData = try? encoder.encode(data) else {
            print("Could not encode data")
            return false
        }
        
        return FileManager.default.createFile(atPath: path, contents: encodedData, attributes: nil)
    }
}

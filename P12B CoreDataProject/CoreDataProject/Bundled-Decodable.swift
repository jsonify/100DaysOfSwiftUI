//
//  Bundled-Decodable.swift
//  CoreDataProject
//
//  Created by Jason on 12/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

// Creating an extension for bundle brings the code out of the View, to keep it small and focused.

extension Bundle {
    // Making the decode generic give flexibility for the type
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to located \(file) in bundle.")
        }
        
        // Using Data(contentsOf:) because Codable uses the Data type
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        // Format the date better
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}

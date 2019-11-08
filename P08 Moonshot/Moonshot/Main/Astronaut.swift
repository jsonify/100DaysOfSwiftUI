//
//  Astronaut.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

// convert the astronaut.json data into a struct
// Codable will allow for it to create an instance from the JSON
// Identifiable will allow for arrays of astronauts inside ForEach and more!˜
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

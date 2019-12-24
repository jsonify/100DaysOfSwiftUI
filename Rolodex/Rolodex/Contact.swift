//
//  Contact.swift
//  Rolodex
//
//  Created by Jason on 12/23/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

struct Contact: Identifiable, Codable {
    var name: String
    
    let id = UUID()
}

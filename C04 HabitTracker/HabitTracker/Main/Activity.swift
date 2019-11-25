//
//  Activity.swift
//  HabitTracker
//
//  Created by Jason on 11/22/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

struct Activity: Identifiable, Codable {
    var name: String
    var description: String
    
    let id = UUID()
}

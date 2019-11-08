//
//  Mission.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation


struct Mission: Codable, Identifiable {
    // Crew roles need their own struct to store the name and role
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    // There may or may not be a launch date, thus it should be Optional
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}

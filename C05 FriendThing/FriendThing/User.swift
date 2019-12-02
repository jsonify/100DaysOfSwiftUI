//
//  User.swift
//  FriendThing
//
//  Created by Jason on 12/1/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    let name: String
    let age: Int
    let company: String
    let id: String
}

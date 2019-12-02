//
//  User.swift
//  FriendThing
//
//  Created by Jason on 12/1/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

//
//  Post.swift
//  FetchingWebAPI
//
//  Created by Jason on 12/10/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI
import Foundation

struct Post: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

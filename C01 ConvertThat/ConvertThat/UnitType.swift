//
//  UnitType.swift
//  ConvertThat
//
//  Created by Jason Rueckert on 10/15/19.
//  Copyright © 2019 Jason Rueckert. All rights reserved.
//

import Foundation

protocol UnitType {
    static var name: String { get }
    static var units: [NamedUnit] { get }
}

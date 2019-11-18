//
//  Order2.swift
//  CupcakeCorner
//
//  Created by Jason on 11/17/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

class Order2: ObservableObject {
    static var types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}

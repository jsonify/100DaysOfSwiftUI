//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jason on 11/16/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        // to make sure that both extraFrosting and addSprinkles are reset to false when specialRequestEnabled is set to false, we can make this happen by adding a didSet property observer to specialRequestEnabled.
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}

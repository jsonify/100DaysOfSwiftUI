//
//  Order2.swift
//  CupcakeCorner
//
//  Created by Jason on 11/17/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

// Challenge 3
class Order2: ObservableObject {
    @Published var orderInfo: OrderInfo
    
    enum CodingKeys: CodingKey {
        case orderInfo
    }
    
    init() {
        self.orderInfo = OrderInfo()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        orderInfo = try container.decode(OrderInfo.self, forKey: .orderInfo)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(orderInfo.self, forKey: .orderInfo)
    }
}

// Challenge 3
struct OrderInfo: Codable {
    
    static var types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
     var type = 0
     var quantity = 3
    
     var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
     var extraFrosting = false
     var addSprinkles = false
    
    
     var name = ""
     var streetAddress = ""
     var city = ""
     var zip = ""
    
    var hasValidAddress: Bool {
        // Challenge 1
        if name.trimmingCharacters(in: .whitespaces).isEmpty
            || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty
            || city.trimmingCharacters(in: .whitespaces).isEmpty
            || zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}

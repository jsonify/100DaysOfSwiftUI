//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jason on 11/16/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

/*
 Swift doesn’t understand how to encode and decode published properties. This is a problem, because we want to submit the user’s order to an internet server, which means we need it as JSON – we need the Codable protocol to work.
 
 The fix here is to add Codable conformance by hand, which means telling Swift what should be encoded, how it should be encoded, and also how it should be decoded – converted back from JSON to Swift data.
 
 iOS comes with some fantastic functionality for handling networking, and in particular the URLSession class makes it surprisingly easy to send and receive data.
 
 If we combine that with Codable to convert Swift objects to and from JSON, and URLRequest, which lets us configure exactly how data should be sent, we can accomplish great things in about 20 lines of code.
 */

class Order: ObservableObject, Codable {
    // add an enum that conforms to CodingKey, listing all the properties we want to save. In our Order class that’s almost everything – the only thing we don’t need is the static types property.
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
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
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
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
    
    // write a new initializer that can create an order without any data whatsoever – it will rely entirely on the default property values we assigned
    init() { }
    
    // implement a required initializer to decode an instance of Order from some archived data
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    // write an encode(to:) method that creates a container using the coding keys enum.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // then write out all the properties attached to their respective key
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
}

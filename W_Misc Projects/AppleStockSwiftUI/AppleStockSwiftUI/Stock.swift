//
//  Stock.swift
//  AppleStockSwiftUI
//
//  Created by Jason on 1/9/20.
//  Copyright © 2020 Jason. All rights reserved.
//


import Foundation

// The Stock model is decorated with Decodable protocol so it can be easily populated with the JSON response.
struct Stock: Decodable {
//    The Stock model property names do not necessarily have to match the property names of JSON response. You can always use the CodingKey protocol to dictate your own property names in the model.
    let symbol: String
    let description: String
    let price: Double
    let change: String
}

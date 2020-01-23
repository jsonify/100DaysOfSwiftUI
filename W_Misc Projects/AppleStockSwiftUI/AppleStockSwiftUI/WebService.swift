//
//  WebService.swift
//  AppleStockSwiftUI
//
//  Created by Jason on 1/9/20.
//  Copyright © 2020 Jason. All rights reserved.
//

/*
 The Webservice that will allow us to consume our custom JSON API.
 
 */

import Foundation

class Webservice {
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        guard let url = URL(string: "https://silicon-rhinoceros.glitch.me/stocks") else {
            fatalError("URL not found")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
//  This web service returns a list of stock objects in a closure on success and nil on failure.
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
        }.resume()
    }
}

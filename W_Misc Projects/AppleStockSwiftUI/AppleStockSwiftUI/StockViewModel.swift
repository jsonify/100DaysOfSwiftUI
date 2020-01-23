//
//  StockViewModel.swift
//  AppleStockSwiftUI
//
//  Created by Jason on 1/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

/*
 View Models are responsible for providing data to the view. The StockViewModel exposes several properties that represent a stock. These properties include symbol, description, price, and change. You can also see that price and symbol have custom formatting because they have to be displayed on the interface in a particular way. The view models give us the flexibility to customize data before its displayed on the view.
 */

import Foundation

struct StockViewModel {
//    The data we need to provide the view is the list of stocks. First, we will create a view model to represent each stock that will be displayed on the screen.
    let stock: Stock
    
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    
    var description: String {
        return self.stock.description
    }
    
    var price: String {
        return String(format: "%.2f", self.stock.price)
    }
    
    var change: String {
        return self.stock.change
    }
}

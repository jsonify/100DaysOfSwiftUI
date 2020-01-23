//
//  StockListViewModel.swift
//  AppleStockSwiftUI
//
//  Created by Jason on 1/10/20.
//  Copyright © 2020 Jason. All rights reserved.
//

/*
 There are a couple of important things to note about StockListViewModel. This is a parent view model that represents the complete screen, displaying stocks, news, and the search bar.
 */

import SwiftUI

// First, it conforms to the ObservableObject protocol. This means it can publish events that can notify the user interface to refresh itself.
class StockListViewModel: ObservableObject {
    
//    The searchTerm property represents the user input for the search field
    @Published var searchTerm: String = ""
//    the stocks represent the list of StockViewModel fetched from the web service.
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func load() {
        fetchStocks()
    }
    
//The fetchStocks function uses the web service to get all the stocks from our custom web API.
    private func fetchStocks() {
        Webservice().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
//Once the stock model objects are fetched they are mapped to the StockViewModel and assigned to the property of the stock of the StockListViewModel class.
                    self.stocks = stocks.map(StockViewModel.init)
                    //    Since the stocks property is decorated with the @Published property wrapper, as soon as it is assigned it will publish an event. This event can be captured by the view and the view can render itself.
                }
            }
        }
    }
}

//
//  AppView.swift
//  iDine
//
//  Created by Jason on 11/26/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text(order.items.count > 0 ? "Cart (\(order.items.count))" : "Cart")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}

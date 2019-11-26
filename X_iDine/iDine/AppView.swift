//
//  AppView.swift
//  iDine
//
//  Created by Jason on 11/26/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AppView: View {
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
                    Text("Order View")
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

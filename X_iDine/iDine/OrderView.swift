//
//  OrderView.swift
//  iDine
//
//  Created by Jason on 11/26/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order

    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                    .disabled(order.items.isEmpty)
                }
            }
            .navigationBarTitle("Order")
        .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}

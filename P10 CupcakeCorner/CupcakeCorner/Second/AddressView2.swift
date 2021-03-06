//
//  AddressView2.swift
//  CupcakeCorner
//
//  Created by Jason on 11/17/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AddressView2: View {
    @ObservedObject var order: Order2
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.orderInfo.name)
                TextField("Street Address", text: $order.orderInfo.streetAddress)
                TextField("City", text: $order.orderInfo.city)
                TextField("Zip", text: $order.orderInfo.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView2(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.orderInfo.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView2_Previews: PreviewProvider {
    static var previews: some View {
        AddressView2(order: Order2())
    }
}

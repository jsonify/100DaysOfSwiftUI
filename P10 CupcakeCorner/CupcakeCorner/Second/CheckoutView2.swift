//
//  CheckoutView2.swift
//  CupcakeCorner
//
//  Created by Jason on 11/18/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct CheckoutView2: View {
    @ObservedObject var order: Order2
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your order costs: $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place Order") {
                        // place order
                    }
                .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
    }
}

struct CheckoutView2_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView2(order: Order2())
    }
}

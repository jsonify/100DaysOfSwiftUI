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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CheckoutView2_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView2(order: Order2())
    }
}

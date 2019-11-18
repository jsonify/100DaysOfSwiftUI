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
    
    @State private var name = ""
    @State private var streetAddress = ""
    @State private var city = ""
    @State private var zip = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressView2_Previews: PreviewProvider {
    static var previews: some View {
        AddressView2(order: Order2())
    }
}

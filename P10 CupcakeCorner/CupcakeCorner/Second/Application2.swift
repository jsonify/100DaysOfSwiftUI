//
//  Application2.swift
//  CupcakeCorner
//
//  Created by Jason on 11/17/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct Application2: View {
    @ObservedObject var order = Order2()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("What kind of cake?", selection: $order.type) {
                        ForEach(0..<Order2.types.count) {
                            Text(Order2.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cupcakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any Special Request?")
                    }
                    
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView2(order: order)) {
                        Text("Delivery Details")
                    }
                }
            }
        .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct Application2_Previews: PreviewProvider {
    static var previews: some View {
        Application2()
    }
}

//
//  CheckoutView.swift
//  iDine
//
//  Created by Jason on 11/26/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    
    static let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    @State private var pickupTime = 0
    
    @State private var paymentType = 1
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var pickupInfo: String {
        return Self.pickupTimes[pickupTime].lowercased()
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0..<Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Use iDone loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine id", text:  $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage amount", selection: $tipAmount) {
                    ForEach(0..<Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Pickup Information")) {
                Picker("What time will you pick up?", selection: $pickupTime) {
                    ForEach(0..<Self.pickupTimes.count) {
                        Text("\(Self.pickupTimes[$0])")
                    }
                }
            .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                Text("$\(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)
            ) {
                Button("Confirm Order") {
                    // place order
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order Confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%2.f") and is set to be picked up \(Self.pickupTimes[pickupTime].lowercased())."), dismissButton: .default(Text("Ok")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}

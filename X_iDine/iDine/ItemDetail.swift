//
//  ItemDetail.swift
//  iDine
//
//  Created by Jason on 11/25/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    /*
     the @EnvironmentObject property wrapper does some magic: it allows this variable not to have a value in code, because we’re saying it will already be set in the environment.

     When this view is shown, SwiftUI will automatically look in its list of environment objects for something that is of type Order, and attach it to that property. If no Order object can be found then we have a problem: something we said would be there isn’t, and our code will crash. This is just like an implicitly unwrapped optional, so be careful with it.
     */
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .background(Color.black)
                    .padding(4)
                    .font(.caption)
                    .foregroundColor(.white)
                .offset(x: -5, y: -5)
                
            }
            Text(item.description)
                .padding()
            
            Button("Order This") {
                self.order.add(item: self.item)
            }
            .font(.headline)
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}

//
//  ItemDetail.swift
//  iDine
//
//  Created by Jason on 11/25/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
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
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}

//
//  DeletingItems.swift
//  iExpense
//
//  Created by Jason on 11/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct DeletingItems: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
        .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeletingItems_Previews: PreviewProvider {
    static var previews: some View {
        DeletingItems()
    }
}

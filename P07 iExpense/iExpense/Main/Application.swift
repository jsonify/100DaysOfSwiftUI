//
//  Application.swift
//  iExpense
//
//  Created by Jason on 11/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct Application: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
//                        Challenge 2
                        self.itemAmount(amount: item.amount)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
//                Challenge 1
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus" )
                }
            )
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    //    Challenge 2
    func itemAmount(amount: Int) -> Text {
        switch (amount < 10, amount > 100) {
        case (true, false):
            return Text("$\(amount)").foregroundColor(.green)
        case (false, false):
            return Text("$\(amount)").foregroundColor(.black)
            case (false, true):
            return Text("$\(amount)").foregroundColor(.red)
        default:
            return Text("")
        }
    }
    
    
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}

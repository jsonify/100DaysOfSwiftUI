//
//  AddView.swift
//  iExpense
//
//  Created by Jason on 11/7/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
//    Challeng 3
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add New Expense")
            .navigationBarItems(trailing:
                Button("Save") {
                    guard let actualAmount = Int(self.amount) else {
                        self.wrongAmount()
                        return
                    }
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
//                Challeng 3
            .alert(isPresented: $showingError) {
                    Alert(title: Text("\(errorTitle)"), message: Text("\(errorMessage)"), dismissButton: .default(Text("OK")))
            }
        }
    }
//    Challeng 3
    func wrongAmount() {
        errorTitle = "Wrong Amount!"
        errorMessage = "That's not a valid number"
        showingError = true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}

//
//  AddContactView.swift
//  Rolodex
//
//  Created by Jason on 12/24/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var contacts: Contacts
    
    @State private var name = ""
    
    private var disableSave: Bool {
        name == ""
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add new Contact")
            .navigationBarItems(
                trailing: Button("Save") {
                    self.validateContact()
                    self.presentationMode.wrappedValue.dismiss()
                }
                .disabled(disableSave)
            )
        }
    }
    
    func validateContact() {
        guard name != "" else {
            return
        }
        let contact = Contact(name: name)
        contacts.items.append(contact)
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView(contacts: Contacts())
    }
}

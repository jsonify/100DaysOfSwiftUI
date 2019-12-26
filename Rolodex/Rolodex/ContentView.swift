//
//  ContentView.swift
//  Rolodex
//
//  Created by Jason on 12/23/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contacts = Contacts()
    @State private var showingNewContact = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Add Contact") {
                    self.showingNewContact = true
                }
                
                List {
                    ForEach(contacts.items.indices, id: \.self) { idx in
                        NavigationLink(destination: ContactView(contact: self.$contacts.items[idx])) {
                            Text(self.contacts.items[idx].name)
                        }
                    }
                    .onDelete(perform: removeContact)
                }
            }
            .navigationBarTitle("Rolodex")
        .padding()
        }
        .sheet(isPresented: $showingNewContact) {
            AddContactView(contacts: self.contacts)
        }
    }
    
    func removeContact(at offsets: IndexSet) {
        contacts.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

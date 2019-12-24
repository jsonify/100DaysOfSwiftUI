//
//  ContactView.swift
//  Rolodex
//
//  Created by Jason on 12/23/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    @Binding var contact: Contact
    
    var body: some View {
        VStack {
            Text(contact.name)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    @State static var contacts = Contact(name: "What")
    
    static var previews: some View {
        ContactView(contact: $contacts)
    }
}

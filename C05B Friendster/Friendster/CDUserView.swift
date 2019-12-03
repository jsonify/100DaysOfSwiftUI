//
//  CDUserView.swift
//  Friendster
//
//  Created by Jason on 12/2/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct CDUserView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CDUser.entity(), sortDescriptors: []) var cdusers: FetchedResults<CDUser>
    
    let user: CDUser
    
    var body: some View {
        Group {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 70.0, height: 70.0, alignment: .center)
                    .foregroundColor(user.isActive ? .green : .red)
                Text("\(user.age) years old")
            }
            .padding()
            Form {
                Section(header: Text("Contact")) {
                    Text(user.wrappedCompany)
                    Text(user.wrappedAddress)
                    Text(user.wrappedEmail)
                }
                
                Section(header: Text("Friends")) {
                    Text("Some people here")
                }
            }
        }
        .navigationBarTitle(Text(user.wrappedName), displayMode: .inline)
        
    }
}

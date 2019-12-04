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
    var friends: [CDUser] {
        var matches = [CDUser]()
        
        for friend in user.friendsArray {
            if let match = cdusers.first(where: { $0.id == friend.id}) {
                matches.append(match)
            } else {
                fatalError("Could not find \(friend)")
            }
            
        }
        return matches
    }
    
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
                    ForEach(friends, id: \.id) { (friend: CDUser) in
                        Text(friend.wrappedName)
                    }
                }
            }
        }
        .navigationBarTitle(Text(user.wrappedName), displayMode: .inline)
        
    }
}

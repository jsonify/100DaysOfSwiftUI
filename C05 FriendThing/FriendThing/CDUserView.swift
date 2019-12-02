//
//  CDUserView.swift
//  FriendThing
//
//  Created by Jason on 12/1/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct CDUserView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CDUser.entity(), sortDescriptors: [], predicate: nil) var cdUsers: FetchedResults<CDUser>

    let user: CDUser
    var friends: [CDUser] {
        var matches = [CDUser]()
        
        for friend in user.friendsArray {
            if let match = cdUsers.first(where: { $0.id == friend.id }) {
                matches.append(match)
            } else {
                fatalError("Missing \(friend)")
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
                    .foregroundColor(user.isActive ? .green : .gray)
                Text(user.wrappedName)
            }
        .padding()
            
            Form {
                Section(header: Text("Contact")) {
                    Text(user.wrappedCompany)
                    Text(user.wrappedAddress)
                    Text(user.wrappedEmail)
                }
                
                Section(header: Text("About")) {
                    Text(user.wrappedAbout)
                }
                
                Section(header: Text("Friends")) {
                    ForEach(friends, id: \.self) { (friend: CDUser) in
                        Text(friend.wrappedName)
                    }
                }
            }
        }
    }
}

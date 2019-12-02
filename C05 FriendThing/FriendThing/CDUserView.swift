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
            if let match = cdusers.first(where: { $0.id == friend.id }) {
                matches.append(match)
            } else {
                fatalError("Missing \(friend)")
            }
        }
        return matches
    }
    
    var body: some View {
        Text(user.wrappedName)
    }
}

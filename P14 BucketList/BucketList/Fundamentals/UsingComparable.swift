//
//  UsingComparable.swift
//  BucketList
//
//  Created by Jason on 12/13/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

/*
 We can make our own types conform to Comparable, and when we do so we also get a sorted() method with no parameters. This takes two steps:

 */

// 1. Add the Comparable conformance to the definition of User.
struct User: Identifiable, Comparable {
    // 2. Add a method called < that takes two users and returns true if the first should be sorted before the second.
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}

struct UsingComparable: View {
    let values = [1, 5, 2, 7, 3, 9].sorted()
    let users = [
        User(firstName: "Jason", lastName: "Rueckert"),
        User(firstName: "Paul", lastName: "Hudson"),
        User(firstName: "David", lastName: "Allen")
        ].sorted()
    
    var body: some View {
//        List(values, id: \.self) {
//            Text(String($0))
//        }
        
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

struct UsingComparable_Previews: PreviewProvider {
    static var previews: some View {
        UsingComparable()
    }
}

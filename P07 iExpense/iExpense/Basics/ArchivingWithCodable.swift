//
//  ArchivingWithCodable.swift
//  iExpense
//
//  Created by Jason on 11/6/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct User2: Codable {
    var firstName: String
    var lastName: String
}

struct ArchivingWithCodable: View {
    @State private var user = User2(firstName: "Taylor", lastName: "Swift")
    
    var defaults = UserDefaults.standard
    var userDataKey = "UserData"
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                self.defaults.set(data, forKey: self.userDataKey)
            }
        }
    }
}

struct ArchivingWithCodable_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingWithCodable()
    }
}

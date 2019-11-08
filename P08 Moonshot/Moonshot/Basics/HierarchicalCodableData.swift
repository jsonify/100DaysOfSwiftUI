//
//  HierarchicalCodableData.swift
//  Moonshot
//
//  Created by Jason on 11/8/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct HierarchicalCodableData: View {
    var body: some View {
        // Create a string of JSON in code to be used by the button
        Button("Decode JSON") {
            let input = """
            {
            "name": "Taylor Swift",
            "address": {
                "street": "555 Taylor Swift Ave.",
                "city": "Nashville"
                }
            }
            """
            // Create separate types to decode hierarchical data
            struct User: Codable {
                var name: String
                var address: Address
            }
            
            struct Address: Codable {
                var street: String
                var city: String
            }
            
//            convert the JSON string into the Data type
            let data = Data(input.utf8)
//            then decode that into a User instance
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
            
        }
    }
}

struct HierarchicalCodableData_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalCodableData()
    }
}

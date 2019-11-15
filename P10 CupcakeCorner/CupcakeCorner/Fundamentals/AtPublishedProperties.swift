//
//  AtPublishedProperties.swift
//  CupcakeCorner
//
//  Created by Jason on 11/14/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Jason Rueckert"
    
    // 1. this initializer is handed an instance of a new type called Decoder. This contains all our data, but it’s down to us to figure out how to read it.
    // 2. anyone who subclasses our User class must override this initializer with a custom implementation to make sure they add their own values. We mark this using the required keyword: required init. An alternative is to mark this class as final so that subclassing isn’t allowed, in which case we’d write final class User and drop the required keyword entirely.
    required init(from decoder: Decoder) throws {
        // 3. inside the method we ask our Decoder instance for a container matching all the coding keys we already set in our CodingKey struct by writing decoder.container(keyedBy: CodingKeys.self). This means “this data should have a container where the keys match whatever cases we have in our CodingKeys enum. This is a throwing call, because it’s possible those keys don’t exist.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // 4. we can read values directly from that container by referencing cases in our enum – container.decode(String.self, forKey: .name). This provides really strong safety in two ways: we’re making it clear we expect to read a string, so if name gets changed to an integer the code will stop compiling; and we’re also using a case in our CodingKeys enum rather than a string, so there’s no chance of typos.
        name = try container.decode(String.self, forKey: .name)
    }
    
    // we need to tell Swift how to encode this type – how to archive it ready to write to JSON.
    // This step is pretty much the reverse of the initializer we just wrote: we get handed an Encoder instance to write to, ask it to make a container using our CodingKeys enum for keys, then write our values attached to each key.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct AtPublishedProperties: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AtPublishedProperties_Previews: PreviewProvider {
    static var previews: some View {
        AtPublishedProperties()
    }
}

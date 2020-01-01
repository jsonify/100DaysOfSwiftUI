//
//  UsingResultType.swift
//  HotProspects
//
//  Created by Jason on 12/28/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct UsingResultType: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                let url = URL(string: "https://www.apple.com")!
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if data != nil {
                        print("We got data")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }.resume()
        }
    }
    // This says it will either be a string on success or a NetworkError value on failure. This is still a blocking function call, albeit a very fast one.
    func fetchData(from urlString: String) -> Result<String, NetworkError> {
        .failure(.badURL)
    }
    
    // What we really want is a non-blocking call, which means we can’t send back our Result as a return value. Instead, we need to make our method accept two parameters: one for the URL to fetch, and one that is a completion closure that will be called with a value. This means the method itself returns nothing; its data is passed back using the completion closure, which is called at some point in the future.
    func fetchData(from urlString: String, completion: (Result<String, NetworkError>) -> Void) {
        completion(.failure(.badURL))
    }
}

struct UsingResultType_Previews: PreviewProvider {
    static var previews: some View {
        UsingResultType()
    }
}

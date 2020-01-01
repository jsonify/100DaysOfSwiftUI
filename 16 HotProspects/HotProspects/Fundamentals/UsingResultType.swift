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
    
    let resultString = ""
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                self.fetchData(from: "https://www.apple.com") { result in
                    switch result {
                    case .success(let str):
                        print(str)
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Bad URL")
                        case .unknown:
                            print("unknown error")
                        }
                    }
                }
        }
    }
    // This says it will either be a string on success or a NetworkError value on failure. This is still a blocking function call, albeit a very fast one.
    //    func fetchData(from urlString: String) -> Result<String, NetworkError> {
    //        .failure(.badURL)
    //    }
    
    // What we really want is a non-blocking call, which means we can’t send back our Result as a return value. Instead, we need to make our method accept two parameters: one for the URL to fetch, and one that is a completion closure that will be called with a value. This means the method itself returns nothing; its data is passed back using the completion closure, which is called at some point in the future.
    //    func fetchData(from urlString: String, completion: (Result<String, NetworkError>) -> Void) {
    //        completion(.failure(.badURL))
    //    }
    
    // Here’s the third version of our version, which uses @escaping for the closure so we can call it asynchronously
    //    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
    //        DispatchQueue.main.async {
    //            completion(.failure(.badURL))
    //        }
    //    }
    
    // the fourth version of the method we’re going to blend our Result code with the URLSession code
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        // check the URL is OK, otherwise return with a failure
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // the task has completed – push our work back to the main thread
            DispatchQueue.main.async {
                if let data = data {
                    // success: convert the data to a string and send it back
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    // any sort of network failure
                    completion(.failure(.requestFailed))
                } else {
                    // this ought not to be possible, yet here we are
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
}

struct UsingResultType_Previews: PreviewProvider {
    static var previews: some View {
        UsingResultType()
    }
}

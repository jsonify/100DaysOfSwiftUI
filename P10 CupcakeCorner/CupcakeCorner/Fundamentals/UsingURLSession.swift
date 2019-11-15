//
//  UsingURLSession.swift
//  CupcakeCorner
//
//  Created by Jason on 11/15/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

/*
 iOS gives us built-in tools for sending and receiving data from the internet, and if we combine it with Codable support then it’s possible to convert Swift objects to JSON for sending, then receive back JSON to be converted back to Swift objects. Even better, when the request completes we can immediately assign its data to properties in SwiftUI views, causing our user interface to update.
 */

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct UsingURLSession: View {
    @State var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
    .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        /*
         URLSession is the iOS class responsible for managing network requests. You can make your own session if you want to, but it’s very common to use the shared session that iOS creates for us to use – unless you need some specific behavior, using the shared session is fine.

         Our code then calls dataTask(with:) on that shared session, which creates a networking task from a URLRequest and a closure that should be run when the task completes. In our code that’s provided using trailing closure syntax, and as you can see it accepts three parameters:

         data is whatever data was returned from the request.
         response is a description of the data, which might include what type of data it is, how much was sent, whether there was a status code, and more.
         error is the error that occurred.
         */
        URLSession.shared.dataTask(with: request) { data, response, error in
            // check whether the data was set, and if it was try to decode it into an instance of our Response struct because that’s what the iTunes API sends back. We don’t actually want the whole response, just the results array inside it so that our List will show them all.
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct UsingURLSession_Previews: PreviewProvider {
    static var previews: some View {
        UsingURLSession()
    }
}

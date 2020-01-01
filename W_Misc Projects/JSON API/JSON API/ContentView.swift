//
//  ContentView.swift
//  JSON API
//
//  Created by Jason on 1/1/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        Text("Hello, World!")
        
    }
    
    func networkCall() {

        let urlString = "someURL"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    print("Hey")
                    
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(Response.self, from: data) {
                        print(json)
                    }
                }
            }.resume()
            print("Finished")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

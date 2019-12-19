//
//  Webservice.swift
//  FetchingWebAPI
//
//  Created by Jason on 12/10/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

class Webservice {
    func getAllPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
    .resume()
    }
}

//
//  Result.swift
//  BucketList
//
//  Created by Jason on 12/18/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

//The main result contains the result of our query in a key called “query”.
struct Result: Codable {
    let query: Query
}

//Inside the query is a “pages” dictionary, with page IDs as the key and the Wikipedia pages themselves as values.
struct Query: Codable {
    let pages: [Int: Page]
}

//Each page has a lot of information, including its coordinates, title, terms, and more.
struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    // a dictionary with Strings as the key and an array of Strings as the value, as optional
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
    
    static func < (lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}

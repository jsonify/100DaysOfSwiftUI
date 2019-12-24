//
//  Contacts.swift
//  Rolodex
//
//  Created by Jason on 12/23/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

class Contacts: ObservableObject {
    @Published var items = [Contact]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Contact].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}

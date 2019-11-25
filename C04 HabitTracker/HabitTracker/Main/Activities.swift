//
//  Activity.swift
//  HabitTracker
//
//  Created by Jason on 11/22/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [Activity]() {
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
            if let decoded = try? decoder.decode([Activity].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}


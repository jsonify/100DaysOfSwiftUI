//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Jason on 12/5/19.
//  Copyright © 2019 Jason. All rights reserved.
//
import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappdLastName)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}

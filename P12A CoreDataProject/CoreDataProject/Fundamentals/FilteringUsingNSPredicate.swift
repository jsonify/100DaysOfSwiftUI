//
//  FilteringUsingNSPredicate.swift
//  CoreDataProject
//
//  Created by Jason on 12/1/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import CoreData
import SwiftUI

struct FilteringUsingNSPredicate: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format:
        "NOT name BEGINSWITH[c] %@", "e"
    )) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: self.moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.moc.save()
            }
        }
    }
}

struct FilteringUsingNSPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FilteringUsingNSPredicate()
    }
}

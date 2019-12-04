//
//  UsingCoreDataConstraints.swift
//  CoreDataProject
//
//  Created by Jason on 12/1/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct UsingCoreDataConstraints: View {
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>

    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }

            Button("Add") {
                let wizard = Wizard(context: self.moc)
                wizard.name = "Harry Potter"
            }

            Button("Save") {
                do {
                    try self.moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct UsingCoreDataConstraints_Previews: PreviewProvider {
    static var previews: some View {
        UsingCoreDataConstraints()
    }
}

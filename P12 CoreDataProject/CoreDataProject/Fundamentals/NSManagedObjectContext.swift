//
//  NSManagedObjectContext.swift
//  CoreDataProject
//
//  Created by Jason on 12/1/19.
//  Copyright © 2019 Jason. All rights reserved.
//

import SwiftUI

struct NSManagedObjectContext: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            /*
             every managed object is given a hasChanges property, that is true when the object has unsaved changes. And, the entire context also contains a hasChanges property that checks whether any object owned by the context has changes.
             
             This means we always wrap it in a check first because there’s no point doing work that isn’t needed, no matter how small, particularly because if you do enough small work you realize you’ve stacked up some big work
             */
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct NSManagedObjectContext_Previews: PreviewProvider {
    static var previews: some View {
        NSManagedObjectContext()
    }
}

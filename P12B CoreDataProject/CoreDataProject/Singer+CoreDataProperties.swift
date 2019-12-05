//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Jason on 12/5/19.
//  Copyright © 2019 Jason. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}

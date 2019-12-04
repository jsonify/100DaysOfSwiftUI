//
//  CDFriend+CoreDataProperties.swift
//  Friendster
//
//  Created by Jason on 12/2/19.
//  Copyright © 2019 Jason. All rights reserved.
//
//

import Foundation
import CoreData


extension CDFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFriend> {
        return NSFetchRequest<CDFriend>(entityName: "CDFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var friend: CDUser?
    
    public var wrappedName: String {
        name ?? "Jason"
    }
    
    public var wrappedId: String {
        id ?? "xx"
    }

}

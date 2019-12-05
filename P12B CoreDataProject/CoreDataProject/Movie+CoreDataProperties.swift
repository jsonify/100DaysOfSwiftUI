//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Jason on 12/4/19.
//  Copyright © 2019 Jason. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Unknown title"
    }
    
    public var wrappedDirector: String {
        director ?? "Unknown director"
    }
}

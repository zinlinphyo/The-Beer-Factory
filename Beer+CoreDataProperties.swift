//
//  Beer+CoreDataProperties.swift
//  
//
//  Created by Zin Lin Phyo on 11/24/18.
//
//

import Foundation
import CoreData


extension Beer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beer> {
        return NSFetchRequest<Beer>(entityName: "Beer")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var tagline: String?

}

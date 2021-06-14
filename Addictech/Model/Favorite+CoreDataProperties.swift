//
//  Favorite+CoreDataProperties.swift
//  Addictech
//
//  Created by Arles Halley on 14/06/21.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var isFavorite: Bool
    @NSManaged public var techTerm: String?

}

extension Favorite : Identifiable {

}

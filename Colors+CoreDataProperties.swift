//
//  Colors+CoreDataProperties.swift
//  Swatches
//
//  Created by Brigitta Audrey on 26/07/22.
//
//

import Foundation
import CoreData


extension Colors {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Colors> {
        return NSFetchRequest<Colors>(entityName: "Colors")
    }
    
    @nonobjc public class func fetchBasedOnCategory(category: String) -> NSFetchRequest<Colors> {
        let fetchRequest = NSFetchRequest<Colors>(entityName: "Colors")
        let predicate = NSPredicate(format: "category == %@", "\(category)")
        fetchRequest.predicate = predicate
        return fetchRequest
    }
    
    @NSManaged public var blue: Double
    @NSManaged public var category: String?
    @NSManaged public var colorName: String?
    @NSManaged public var green: Double
    @NSManaged public var hexValue: String?
    @NSManaged public var red: Double
    
}

extension Colors : Identifiable {
    
}

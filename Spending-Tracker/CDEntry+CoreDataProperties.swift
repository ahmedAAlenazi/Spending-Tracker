//
//  CDEntry+CoreDataProperties.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 19/05/1443 AH.
//
//

import Foundation
import CoreData


extension CDEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEntry> {
        return NSFetchRequest<CDEntry>(entityName: "CDEntry")
    }

    @NSManaged public var amount: String?
    @NSManaged public var category: String?
    @NSManaged public var currency: String?
    @NSManaged public var date: Date?
    @NSManaged public var note: String?

}

extension CDEntry : Identifiable {

}

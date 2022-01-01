//
//  CDBudget+CoreDataProperties.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 22/05/1443 AH.
//
//

import Foundation
import CoreData


extension CDBudget {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBudget> {
        return NSFetchRequest<CDBudget>(entityName: "CDBudget")
    }

    @NSManaged public var bills: Double
    @NSManaged public var budget: Double
    @NSManaged public var food: Double
    @NSManaged public var health: Double
    @NSManaged public var housing: Double
    @NSManaged public var income: Double
    @NSManaged public var investments: Double
    @NSManaged public var month: Int16
    @NSManaged public var shopping: Double
    @NSManaged public var sum: Double
    @NSManaged public var transport: Double
    @NSManaged public var travel: Double
    @NSManaged public var year: Int16

}

extension CDBudget : Identifiable {

}

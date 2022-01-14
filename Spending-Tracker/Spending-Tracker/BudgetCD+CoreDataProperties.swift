//
//  BudgetCD+CoreDataProperties.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 22/05/1443 AH.
//
//

import Foundation
import CoreData


extension BudgetCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BudgetCD> {
        return NSFetchRequest<BudgetCD>(entityName: "BudgetCD")
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

extension BudgetCD : Identifiable {
    
    
    
}

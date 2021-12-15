//
//  CDCapetil+CoreDataClass.swift
//  
//
//  Created by Ahmed Alenazi on 10/05/1443 AH.
//
//

import Foundation
import CoreData





@objc(CDCapetil)
public class CDCapetil: NSManagedObject {
    
    
    @NSManaged public var acount: String?
    @NSManaged public var incomName: String?
    @NSManaged public var incomType: String?
    @NSManaged public var incomDate: Date?
    @NSManaged public var incom: String?
    @NSManaged public var spendingName: String?
    @NSManaged public var spendingType: String?
    @NSManaged public var spendingDate: Date?
    @NSManaged public var spending: String?


        func create(capetil: Capetil) {

            let context = PersistentStorage.shared.context
            let cdCapetil = CDCapetil(context: context)
            
            cdCapetil.acount = capetil.acount
            cdCapetil.incomName = capetil.incomName
            cdCapetil.incomType = capetil.incomType
            cdCapetil.incomDate = capetil.incomDate
            cdCapetil.incom = capetil.incom
            
            cdCapetil.spendingName = capetil.spendingName
            cdCapetil.spendingType = capetil.spendingType
            cdCapetil.spendingDate = capetil.spendingDate
            cdCapetil.spending = capetil.spending
            PersistentStorage.shared.saveContext()

        }
    
    }



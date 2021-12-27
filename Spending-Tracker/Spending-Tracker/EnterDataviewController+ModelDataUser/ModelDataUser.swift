//
//  File.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 08/05/1443 AH.
//

import Foundation



//
//enum CapetilDataGet {
//
//    case acount
//    case incomName
//    case incomType
//    case incomDate
//    case incom
//    case spendingName
//    case spendingType
//    case spendingDate
//    case spending
//
//}
//
//
//enum Acount {
//
//    case name
//    case income(models : [AcountIncomeData])
//    case spendings(models : [AcountSpendingData])
//
//
//}
//
//struct AcountIncomeData {
//
//    var name:String
//    var number:Int
//    var type:String
//    var date:Date
//
//}
//
//struct AcountSpendingData {
//
//    var name:String
//    var number:Int
//    var type:String
//    var date:Date
//
//}
//
//
//
//struct CapetilData {
//
//    var data : [Acount] = [.name,.income(models: []),.spendings(models: [])]
//
//}



struct Budget {
    
    
    var bills: Double
    var budget: Double
    var food: Double
    var health: Double
    var housing: Double
    var income: Double
    var investments: Double
    var month: Int16
    var shopping: Double
    var sum: Double
    var transport: Double
    var travel: Double
    var year: Int16

    }

struct Entry {
    
     var amount: String?
     var category: String?
     var currency: String?
     var date: Date?
     var note: String?

    
    
    
}

    
    


      




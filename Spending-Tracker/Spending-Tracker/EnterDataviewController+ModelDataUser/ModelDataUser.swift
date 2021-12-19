//
//  File.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 08/05/1443 AH.
//

import Foundation




enum CapetilDataGet {

    case acount
    case incomName
    case incomType
    case incomDate
    case incom
    case spendingName
    case spendingType
    case spendingDate
    case spending

}


enum Acount {

    case name
    case income(models : [AcountIncomeData])
    case spendings(models : [AcountSpendingData])


}

struct AcountIncomeData {

    var name:String
    var number:Int
    var type:String
    var date:Date

}

struct AcountSpendingData {

    var name:String
    var number:Int
    var type:String
    var date:Date

}



struct CapetilData {

    var data : [Acount] = [.name,.income(models: []),.spendings(models: [])]

}

struct Capetil {
   
   var acount: String?
   var incomName: String?
   var incomType: String?
   var incomDate: Date?
   var incom: String?
   var spendingName: String?
   var spendingType: String?
   var spendingDate: Date?
   var spending: String?
   
    }

    
    


      




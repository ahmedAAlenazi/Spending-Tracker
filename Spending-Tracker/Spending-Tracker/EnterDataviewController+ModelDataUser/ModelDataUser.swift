//
//  File.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 08/05/1443 AH.
//

import Foundation

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



//
//  SummaryViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit

class Summary: UIViewController {
    
    // These are labels and fields
var income: UILabel = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 200, width: 250, height: 40))
     
   return labal
 }()
    var incomeLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 250, height: 40))
        labal.text = "total income"
         
       return labal
     }()
    
var expenses: UILabel = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 250, width: 250, height: 40))
//    labal.text = "Utilities (Water, Light, etc.)"
     
   return labal
 }()
    var expensesLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 250, width: 250, height: 40))
        labal.text = "total expenses"
         
       return labal
     }()
    
    
 var savings: UILabel = {
     var labal = UILabel()
     labal = UILabel(frame: CGRect(x: 300, y: 300, width: 250, height: 40))
//     labal.text = "Utilities (Water, Light, etc.)"
      
    return labal
  }()
   
    var savingsLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 250, height: 40))
        labal.text = " total savings"
         
       return labal
     }()
    
    
    var totalInc: Double = 0
    var cost: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(income)
        view.addSubview(incomeLabal)

        view.addSubview(expenses)
        view.addSubview(expensesLabal)

        view.addSubview(savings)
        view.addSubview(savingsLabal)


        
        
        // Pass in the total income data from the previous view controller
        income.text = String(format: "$%.02f", totalInc)
        // Pass in the total expenses data from the previous view controller
        expenses.text = String(format: "$%.02f", cost)
        // Calculate total savings by subtracting total expenses from total income
        savings.text = String(format: "$%.02f", totalInc - cost)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

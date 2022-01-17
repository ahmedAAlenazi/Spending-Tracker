//
//  ExpensesViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit




class Expenses: UIViewController, UITextFieldDelegate
{
    
    private var nextBotton : UIButton = {
        
        
        var botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Next", comment: ""), for: [])
        botton.backgroundColor = .black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

        
        
        return botton
        
    }()
    
    var Fixed: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 50, width: 200, height: 40))
        labal.text = NSLocalizedString("Fixed Expenses", comment: "")
        labal.font = .preferredFont(forTextStyle: .title1, compatibleWith: nil)
       return labal
     }()
    var Flexible: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 250, height: 40))
        labal.text = NSLocalizedString("Flexible Expenses", comment: "")
        labal.font = .preferredFont(forTextStyle: .title1, compatibleWith: nil)

       return labal
     }()
    
    
    
var textField1: UITextField = {
    var textField = UITextField()
     textField = UITextField(frame: CGRect(x: 300, y: 100, width: 60, height: 40))
     
     
     
    return textField
 }()
    var textFieldLabal1: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 40))
        labal.text = NSLocalizedString("Telephone/TV/Internet", comment: "")
         
       return labal
     }()
    
    
    
    
    
var textField2: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 150, width: 60, height: 40))
     
     
    return textField
 }()
    
    var textFieldLabal2: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 150, width: 250, height: 40))
        labal.text = NSLocalizedString("Utilities (Water, Light, etc.)", comment: "")
         
       return labal
     }()
    
    
    
var textField3: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 200, width: 60, height: 40))
     
     
    return textField
 }()
    
    var textFieldLabal3: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        labal.text = NSLocalizedString("Insurance", comment: "")
         
       return labal
     }()
    
    
    
var textField4: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 250, width: 60, height: 40))
     
     
     
    return textField
 }()
    var textFieldLabal4: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 250, width: 200, height: 40))
        labal.text = NSLocalizedString("Rent/Mortgage", comment: "")
         
       return labal
     }()
    
    
    
var textField5: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 350, width: 60, height: 40))
     
     
     
    return textField
 }()
    var textFieldLabal5: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 350, width: 200, height: 40))
        labal.text = NSLocalizedString("Food/Groceries", comment: "")
         
       return labal
     }()
    
    
    
var textField6: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 400, width: 60, height: 40))
     
     
     
    return textField
 }()
    var textFieldLabal6: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 400, width: 200, height: 40))
        labal.text = NSLocalizedString("Education Expenses", comment: "")
         
       return labal
     }()
    
    
    
    
var textField7: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 450, width: 60, height: 40))
     
     
     
    return textField
 }()
    var textFieldLabal7: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 450, width: 200, height: 40))
        labal.text = NSLocalizedString("Clothing", comment: "")
         
       return labal
     }()
    
    
    
    
var textField8: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 500, width: 60, height: 40))
     
     
     
    return textField
 }()
    var textFieldLabal8: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 500, width: 200, height: 40))
        labal.text = NSLocalizedString("Recreation/Entertainment", comment: "")
         
       return labal
     }()
    
    
    
    
var fundsAvailable: UILabel  = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 20, y: 600, width: 200, height: 40))
    labal.text = "$0.00"
     
   return labal
 }()
    
    var fund: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 550, width: 200, height: 40))
        labal.text = NSLocalizedString("Funds Available", comment: "")
         
       return labal
     }()
    
    
    
var costs: UILabel  = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 600, width: 200, height: 40))
    labal.text = "$0.00"
     
   return labal
 }()
    
    var cost: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 250, y: 550, width: 200, height: 40))
        labal.text = NSLocalizedString("Total Expenses", comment: "")
       return labal
     }()
    
    
    var total: Double = 0
    var totalInc: Double = 0
    var funds: Double = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        view.addSubview(nextBotton)
        constrainsBottons()
        
        view.addSubview(cost)
        view.addSubview(costs)
        
        view.addSubview(fund)
        view.addSubview(fundsAvailable)
        
        
        view.addSubview(Fixed)
        view.addSubview(Flexible)
        
        view.addSubview(textField1)
        view.addSubview(textFieldLabal1)

        view.addSubview(textField2)
        view.addSubview(textFieldLabal2)

        view.addSubview(textField3)
        view.addSubview(textFieldLabal3)

        view.addSubview(textField4)
        view.addSubview(textFieldLabal4)

        view.addSubview(textField5)
        view.addSubview(textFieldLabal5)

        view.addSubview(textField6)
        view.addSubview(textFieldLabal6)

        view.addSubview(textField7)
        view.addSubview(textFieldLabal7)

        view.addSubview(textField8)
        view.addSubview(textFieldLabal8)


        
        
        
        
        
        // Connects text fields to class
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        textField7.delegate = self
        textField8.delegate = self
        // Initialize text fields to 0
        textField1.text = "\(Double(0))"
        textField2.text = "\(Double(0))"
        textField3.text = "\(Double(0))"
        textField4.text = "\(Double(0))"
        textField5.text = "\(Double(0))"
        textField6.text = "\(Double(0))"
        textField7.text = "\(Double(0))"
        textField8.text = "\(Double(0))"
        
        totalInc = total
        fundsAvailable.text = String(format: "$%.02f", total)
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    // Define a function that allows the user to sum up different expense fields
    func sum() -> Double
    {
        var sum = Double()
        
        // Ensure the text field is not nil. Sums up fields.
        if (textField1.text != "")
        {
            sum = sum + Double(textField1.text!)!
        }
        if (textField2.text != "")
        {
            sum = sum + Double(textField2.text!)!
        }
        if (textField3.text != "")
        {
            sum = sum + Double(textField3.text!)!
        }
        if (textField4.text != "")
        {
            sum = sum + Double(textField4.text!)!
        }
        if (textField5.text != "")
        {
            sum = sum + Double(textField5.text!)!
        }
        if (textField6.text != "")
        {
            sum = sum + Double(textField6.text!)!
        }
        if (textField7.text != "")
        {
            sum = sum + Double(textField7.text!)!
        }
        if (textField8.text != "")
        {
            sum = sum + Double(textField8.text!)!
        }
    
        // Return the sum in traditional dollar format with 2 decimal places
        return round(sum * 100) / 100
    }
    
func textFieldChanged(_ sender: UITextField)
    {
        if (sender.text != "")
        {
            // Update the total expenses
            let cost = sum()
            // Pass the value of total expenses into the costs text field
            costs.text = String(format: "$%.02f", cost)
            
            // Calculates funds available
            total = totalInc - cost
            funds = round(total * 100) / 100
            // Update the funds available by passing in the variable calculated
            fundsAvailable.text = String(format: "$%.02f", funds)
        }
    }
    
    
    // Pass total income and total expenses variables from expenses view screen to summary view screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let destVC : Summary = segue.destination as! Summary
        destVC.totalInc = totalInc
        destVC.cost = sum()
    }
    
    @objc func nextPage(sender: UIButton!)  {
       
        print("Button tapped")
        performSegue(withIdentifier: "toSummary", sender: nil)
    }
    
    func constrainsBottons(){
        
        
        nextBotton.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        nextBotton.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        nextBotton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        nextBotton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
}

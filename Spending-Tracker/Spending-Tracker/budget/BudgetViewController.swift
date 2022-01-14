//
//  BudgetViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit

class BudgetViewController: UIViewController, UITextFieldDelegate {
    
    
   // These are labels and fields
 var takeHomePayField: UITextField  = {
     var textField = UITextField()
      textField = UITextField(frame: CGRect(x: 300, y: 100, width: 60, height: 40))
      
      
     return textField
  }()
    var takeHomePayLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 40))
        labal.text = "Regular Take-Home Pay"
         
       return labal
     }()
    
    
    
    
 var dividendsField: UITextField  = {
     var textField = UITextField()
     textField = UITextField(frame: CGRect(x: 300, y: 200, width: 60, height: 40))

      
      
     return textField
  }()
    var dividendsLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        labal.text = "Dividends from Stocks"
         
       return labal
     }()
    
    
    
    
    
 var pensionsField: UITextField  = {
     var textField = UITextField()
     textField = UITextField(frame: CGRect(x: 300, y: 300, width: 60, height: 40))

      
      
     return textField
  }()
    var pensionsLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 40))
        labal.text = "Pensions/Social Security"
         
       return labal
     }()
    
    
    
    
    
    
    
 var interestField: UITextField  = {
     var textField = UITextField()
     textField = UITextField(frame: CGRect(x: 300, y: 400, width: 60, height: 40))

      
      
     return textField
  }()
    
    var interestLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 400, width: 200, height: 40))
        labal.text = "Interest from Accounts"
         
       return labal
     }()
    
    
    
    
    
    
    
    
    
 var calculation: UILabel  = {
     var labal = UILabel()

     labal = UILabel(frame: CGRect(x: 300, y: 500, width: 90, height: 40))
     labal.text = "$0.00"
      

      
    return labal
  }()
    var calculationLabal: UILabel  = {
        var labal = UILabel()

        labal = UILabel(frame: CGRect(x: 20, y: 500, width: 200, height: 40))
        labal.text = "Calculate Total Income!"
         

         
       return labal
     }()
    private var calculateBotton : UIButton = {
        
        
        var botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle("calculate", for: [])
        botton.backgroundColor = UIColor.systemPurple
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        
        
        return botton
        
    }()
    
    private var nextBotton : UIButton = {
        
        
        var botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle("Next", for: [])
        botton.backgroundColor = UIColor.systemPurple
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

        
        
        return botton
        
    }()
    var total: Double = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(takeHomePayField)
        view.addSubview(takeHomePayLabal)

        view.addSubview(pensionsField)
        view.addSubview(pensionsLabal)

        view.addSubview(interestField)
        view.addSubview(interestLabal)

        view.addSubview(dividendsField)
        view.addSubview(dividendsLabal)
        
        
        view.addSubview(calculation)
        view.addSubview(calculationLabal)
        
        view.addSubview(calculateBotton)
        view.addSubview(nextBotton)

        constrainsBottons()

        // Connects text fields to class
        takeHomePayField.delegate = self
        pensionsField.delegate = self
        interestField.delegate = self
        dividendsField.delegate = self
        
        // Initialize text fields to 0
        takeHomePayField.text = "\(Double(0))"
        pensionsField.text = "\(Double(0))"
        interestField.text = "\(Double(0))"
        dividendsField.text = "\(Double(0))"
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
        
    // When “calculate total income!” button is pressed, the total income is displayed after summing up each input in each text field
    @objc func buttonPressed(_ sender: UIButton)
    {
        if let w = Double(takeHomePayField.text!), let x = Double(pensionsField.text!), let y = Double(interestField.text!), let z = Double(dividendsField.text!) {
        let totalInc = round(totalIncome(takeHomePay: w, pensionsSocialSecurity: x, interest: y, dividends: z) * 100) / 100
        calculation.text = String(format: "$%.02f", totalInc)
        total = totalIncome(takeHomePay: w, pensionsSocialSecurity: x, interest: y, dividends: z)}
    }
    // Pass total income variable from the view controller view screen to the expenses view screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : Expenses = segue.destination as! Expenses
        destVC.total = self.total
    }
    
    @objc func nextPage(sender: UIButton!)  {
       
        print("Button tapped")
        performSegue(withIdentifier: "toEpenses", sender: nil)
    }
    
    func constrainsBottons(){
        
        
        calculateBotton.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        calculateBotton.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        calculateBotton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        calculateBotton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        
        
        nextBotton.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        nextBotton.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        nextBotton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        nextBotton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
}

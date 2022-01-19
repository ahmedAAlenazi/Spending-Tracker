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
        labal.text = NSLocalizedString("Regular Take-Home Pay", comment: "")
         
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
        labal.text = NSLocalizedString("Dividends from Stocks", comment: "")
         
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
        labal.text = NSLocalizedString("Pensions/Social Security", comment: "")
         
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
        labal.text = NSLocalizedString("Interest from Accounts", comment: "")
         
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
        labal.text = NSLocalizedString("Calculate Total Income!", comment: "")
         

         
       return labal
     }()
    private var calculateBotton : UIButton = {
        
        
        var botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Calculate", comment: ""), for: [])
        botton.backgroundColor = .black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        
        
        return botton
        
    }()
    
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
    
    
    private var bottonExplane : UIButton = {
        
        
        let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Explane", comment: ""), for: [])
        botton.backgroundColor = .black.withAlphaComponent(0.5)
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
        view.addSubview(bottonExplane)
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
        
        
        if sender == bottonExplane {
            
        performSegue(withIdentifier: "BudgetExplane", sender: nil)
    }
        
        performSegue(withIdentifier: "toEpenses", sender: nil)
    }
    
    func constrainsBottons(){
        
        
        calculateBotton.centerXAnchor.constraint(equalTo:self.view.centerXAnchor,constant: 80).isActive = true
        calculateBotton.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        calculateBotton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        calculateBotton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        bottonExplane.centerXAnchor.constraint(equalTo:self.view.centerXAnchor,constant: -80).isActive = true
        bottonExplane.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonExplane.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonExplane.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        
        nextBotton.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        nextBotton.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        nextBotton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        nextBotton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
}

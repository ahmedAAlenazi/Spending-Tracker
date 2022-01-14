//
//  AnniutyViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit

class AnnuityViewController: UIViewController, UITextFieldDelegate {
    
var payment: UITextField  = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 200, width: 60, height: 40))
    textField.backgroundColor = .blue

     
     
    return textField
 }()
    var paymentLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        labal.text = NSLocalizedString("Payment", comment: "")
         
         
       return labal
     }()
      
var interest: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 250, width: 60, height: 40))
    textField.backgroundColor = .blue

     
     
    return textField
 }()
    var interestLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 250, width: 200, height: 40))
        labal.text = NSLocalizedString("Interest (%)", comment: "")
         
         
       return labal
     }()
    
    
    
var number: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 300, width: 60, height: 40))
    textField.backgroundColor = .blue
     
     
    return textField
 }()
    
    var numberLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 40))
        labal.text = NSLocalizedString("Number of Payments", comment: "")
         
         
       return labal
     }()
    
    
    private var bottonCalculate : UIButton = {
        
        
        let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Calculate", comment: ""), for: [])
        botton.backgroundColor = UIColor.systemPurple
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
       
        return botton
        
    }()
    
    
    
    
    
var calcOrdinary: UILabel  = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 400, width: 60, height: 40))
    labal.backgroundColor = .blue

   return labal
 }()
    var calcOrdinaryLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 400, width: 200, height: 40))
        labal.text = NSLocalizedString("Present", comment: "")
        
         
       return labal
     }()
    
    
    
var calcFuture: UILabel  = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 450, width: 60, height: 40))
    labal.backgroundColor = .blue

     
   return labal
 }()
    var calcFutureLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 450, width: 200, height: 40))
        labal.text = NSLocalizedString("Future", comment: "")
        
         
       return labal
     }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(calcOrdinary)
        view.addSubview(calcOrdinaryLabal)
        view.addSubview(calcFuture)
        view.addSubview(calcFutureLabal)

        
        
        view.addSubview(bottonCalculate)

        view.addSubview(payment)
        view.addSubview(interest)
        view.addSubview(number)
        
        view.addSubview(paymentLabal)
        view.addSubview(interestLabal)
        view.addSubview(numberLabal)

        payment.delegate = self
        interest.delegate = self
        number.delegate = self
        
        
        
        constrainsBottons()

        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        
    }
    @objc func buttonPressed(_ sender: UIButton) {
        print("botton tap")
        // Check that all inputs are numbers
        if let PMT = Double(payment.text!), let r = Double(interest.text!), let T = Double(number.text!) {
            // Shows the calculation
            calcOrdinary.text = String(presentOrdinaryAnnuity(payment: PMT, interest: r/100, numberOfPayments: T))
            calcFuture.text = String(futureOrdinaryAnnuity(payment: PMT, interest: r/100, numberOfPayments: T))
        }
    }
    
    func constrainsBottons(){
        
        bottonCalculate.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        bottonCalculate.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonCalculate.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonCalculate.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
}

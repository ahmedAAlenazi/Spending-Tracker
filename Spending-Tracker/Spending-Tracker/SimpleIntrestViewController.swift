//
//  SimpleIntrestViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit

class SimpleInterestVC: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
var principal: UITextField  = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 200, width: 60, height: 40))
    textField.backgroundColor = .blue

     
     
    return textField
 }()
    var principalLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        labal.text = NSLocalizedString("Principal", comment: "")

         
       return labal
     }()
    
    
var interest: UITextField  = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 250, width: 60, height: 40))
    textField.backgroundColor = .blue

     
     
    return textField
 }()
    var interestLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 250, width: 200, height: 40))
        labal.text = NSLocalizedString("Interest (%)", comment: "")

         
       return labal
     }()
    
    
    
var periods: UITextField  = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 300, width: 60, height: 40))
    textField.backgroundColor = .blue

     
     
     
    return textField
 }()
    var periodsLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 40))
        labal.text = "Periods"

         
       return labal
     }()
    
    
    
    
var calculation: UILabel = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 400, width: 200, height: 40))

     
   return labal
 }()
    var calculationLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 400, width: 200, height: 40))
        labal.text = "Result"

         
       return labal
     }()
    
    private var bottonCalculate : UIButton = {
        
        
        let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle("Calculate", for: [])
        botton.backgroundColor = UIColor.systemPurple
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
       
        return botton
        
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(principal)
        view.addSubview(principalLabal)
        view.addSubview(interest)
        view.addSubview(interestLabal)
        view.addSubview(periods)
        view.addSubview(periodsLabal)
        view.addSubview(calculation)
        view.addSubview(calculationLabal)
        view.addSubview(bottonCalculate)
        constrainsBottons()
        principal.delegate = self
        interest.delegate = self
        periods.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func buttonPressed(_ sender: UIButton)
    {
        //Show simple interest calculation
        if let p = Double(principal.text!), let r = Double(interest.text!), let T = Double(periods.text!) {
            calculation.text = String(p+simpleInterestOf(principal: p, interest: r/100, periods: T))
        }
    }
    func constrainsBottons(){
        
        bottonCalculate.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        bottonCalculate.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonCalculate.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonCalculate.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
}


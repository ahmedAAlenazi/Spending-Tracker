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
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 12
     
    return textField
 }()
    var principalLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 150, height: 40))
        labal.text = NSLocalizedString("Principal", comment: "")

         
       return labal
     }()
    
    
var interest: UITextField  = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 250, width: 60, height: 40))
    
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 12
     
     
    return textField
 }()
    var interestLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 250, width: 150, height: 40))
        labal.text = NSLocalizedString("Interest (%)", comment: "")

         
       return labal
     }()
    
    
    
var periods: UITextField  = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 300, width: 60, height: 40))
    
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 12
     
     
     
    return textField
 }()
    var periodsLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 100, height: 40))
        labal.text = NSLocalizedString("Periods", comment: "")

         
       return labal
     }()
    
    
    
    
var calculation: UILabel = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 400, width: 60, height: 40))

    labal.layer.masksToBounds = true
    labal.backgroundColor = .white
    labal.layer.cornerRadius = 12
    
   return labal
 }()
    var calculationLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 400, width: 100, height: 40))
        labal.text = NSLocalizedString("Result", comment: "")

         
       return labal
     }()
    
    private var bottonCalculate : UIButton = {
        
        
        let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Calculate", comment: ""), for: [])
        botton.backgroundColor = .black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
       
        return botton
        
    }()
    private var bottonExplane : UIButton = {
        
        
        let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Explane", comment: ""), for: [])
        botton.backgroundColor = .black.withAlphaComponent(0.5)
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
        view.addSubview(bottonExplane)
        constrainsBottons()
        principal.delegate = self
        interest.delegate = self
        periods.delegate = self
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func buttonPressed(_ sender: UIButton)
    {
        
        
        if sender == bottonExplane {
        performSegue(withIdentifier: "SimpleExplane", sender: nil)
    }
        //Show simple interest calculation
        if let p = Double(principal.text!), let r = Double(interest.text!), let T = Double(periods.text!) {
            calculation.text = String(p+simpleInterestOf(principal: p, interest: r/100, periods: T))
        }
    }
    func constrainsBottons(){
        
        bottonCalculate.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: 70).isActive = true
        bottonCalculate.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonCalculate.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonCalculate.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        
        
        bottonExplane.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: -70).isActive = true
        bottonExplane.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonExplane.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonExplane.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        
    }
}


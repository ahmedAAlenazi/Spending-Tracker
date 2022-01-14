//
//  CompoundViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit

class CompoundViewController: UIViewController, UITextFieldDelegate {

var principal: UITextField = {
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
    
    
    
var interest: UITextField = {
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
    
    
var compoundings: UITextField = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 300, width: 60, height: 40))
    textField.backgroundColor = .blue

     
     
    return textField
 }()
    var compoundingsLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 40))
        labal.text = NSLocalizedString("Compoundings", comment: "")
         
       return labal
     }()
   
    
    
    
var periods: UITextField = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 350, width: 60, height: 40))
    textField.backgroundColor = .blue

     
     
    return textField
 }()
    
    var periodsLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 350, width: 200, height: 40))
        labal.text = "Periods"
         
       return labal
     }()
   
    
var calculation: UILabel = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 450, width: 200, height: 40))

     
   return labal
 }()
    var calculationLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 450, width: 200, height: 40))
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
        view.addSubview(compoundings)
        view.addSubview(compoundingsLabal)
        view.addSubview(periods)
        view.addSubview(periodsLabal)
        view.addSubview(calculation)
        view.addSubview(calculationLabal)
        view.addSubview(bottonCalculate)

        
        constrainsBottons()
        
        principal.delegate = self
        interest.delegate = self
        compoundings.delegate = self
        periods.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        //Check that all inputs are numbers
        if let p = Double(principal.text!), let r = Double(interest.text!), let N = Double(compoundings.text!), let T = Double(periods.text!) {
            //Shows calculation
            calculation.text = String(compoundInterestOf(principal: p, interest: r/100, compoundings: N, periods: T))
        }
    }
    func constrainsBottons(){
        
        bottonCalculate.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        bottonCalculate.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonCalculate.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonCalculate.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  LaveregeViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit

class LeverageViewController: UIViewController, UITextFieldDelegate {

 var liabilities: UITextField   = {
     var textField = UITextField()
     textField = UITextField(frame: CGRect(x: 300, y: 200, width: 60, height: 40))
     textField.backgroundColor = .gray.withAlphaComponent(0.2)
      
      
     return textField
  }()
    var liabilitiesLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        labal.text = NSLocalizedString("Liabilities", comment: "")
         
         
       return labal
     }()
    
    
    
var debts: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 250, width: 60, height: 40))
    textField.backgroundColor = .gray.withAlphaComponent(0.2)

     
    return textField
 }()
    var debtsLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 250, width: 200, height: 40))
        labal.text = NSLocalizedString("Debts", comment: "")
         
         
       return labal
     }()
    
    
    
    
var income: UITextField   = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 300, width: 60, height: 40))
    textField.backgroundColor = .gray.withAlphaComponent(0.2)

     
    return textField
 }()
    var incomeLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 40))
        labal.text = NSLocalizedString("Income", comment: "")
         
         
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
    
var calculation: UILabel  = {
    var labal = UILabel()
    labal = UILabel(frame: CGRect(x: 300, y: 400, width: 200, height: 40))
    labal.backgroundColor = .gray.withAlphaComponent(0.2)

   return labal
 }()
    var calculationLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 400, width: 200, height: 40))
        labal.text = NSLocalizedString("Result", comment: "")

         
       return labal
     }()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(liabilities)
        view.addSubview(liabilitiesLabal)
        view.addSubview(debts)
        view.addSubview(debtsLabal)
        view.addSubview(income)
        view.addSubview(incomeLabal)
        view.addSubview(bottonCalculate)
        view.addSubview(calculation)
        view.addSubview(calculationLabal)

        
        liabilities.delegate = self
        debts.delegate = self
        income.delegate = self
        
      
        constrainsBottons()
        
        
        // Closes keyboard when user taps outside of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    @objc func buttonPressed(_ sender: UIButton) {
        if let l = Double(liabilities.text!), let d = Double(debts.text!), let i = Double(income.text!) {
            calculation.text = String(leverage(liabilities:l, debts:d, income:i))
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

//
//  CashFlowViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit

class CashFlowViewController: UIViewController, UITextFieldDelegate {
    
    var income: UITextField = {
        var textField = UITextField()
        textField = UITextField(frame: CGRect(x: 300, y: 200, width: 60, height: 40))
        
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12

        
        
       return textField
    }()
    var incomeLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        labal.text = NSLocalizedString("Income", comment: "")

        
      return labal
    }()
    
    
var expenses: UITextField = {
    var textField = UITextField()
    textField = UITextField(frame: CGRect(x: 300, y: 250, width: 60, height: 40))
    
    textField.backgroundColor = .white
    textField.layer.cornerRadius = 12

     
     
    return textField
 }()
    
    var expensesLabal: UILabel = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 250, width: 200, height: 40))
        labal.text = NSLocalizedString("Expenses", comment: "")

        
      return labal
    }()
    
    
    
    var calculation: UILabel = {
       var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 300, y: 400, width: 200, height: 40))

        labal.layer.masksToBounds = true
        labal.backgroundColor = .white
        labal.layer.cornerRadius = 12
        
        
      return labal
    }()
    var calculationLabal: UILabel  = {
        var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 20, y: 400, width: 200, height: 40))
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

        view.addSubview(income)
        view.addSubview(incomeLabal)
        view.addSubview(expenses)
        view.addSubview(expensesLabal)
        view.addSubview(calculation)
        view.addSubview(calculationLabal)
        view.addSubview(bottonCalculate)
        view.addSubview(bottonExplane)

        
        income.delegate = self
        expenses.delegate = self
        constrainsBottons()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }

    @objc func buttonPressed(_ sender: UIButton) {
        
        if sender == bottonExplane {
        performSegue(withIdentifier: "SimpleExplane", sender: nil)
        //Check that all inputs are numbers
        if let i = Double(income.text!), let e = Double(expenses.text!) {
            //Shows calculation
            calculation.text = String(cashFlow(income:i, expenses:e))
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

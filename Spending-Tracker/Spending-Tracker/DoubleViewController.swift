//
//  DoubleViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 06/06/1443 AH.
//

import UIKit


class DoubleViewController: UIViewController, UITextFieldDelegate {

 var interest: UITextField  = {
     var textField = UITextField()
     textField = UITextField(frame: CGRect(x: 300, y: 200, width: 60, height: 40))
     textField.backgroundColor = .blue
      
      
      
     return textField
  }()
    
    
    var interestLabal: UILabel  = {
        var labal = UILabel()
            labal = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        labal.text = NSLocalizedString("Interest (%)", comment: "")
       return labal
     }()
      
    
    
var calculation: UILabel  = {
    var labal = UILabel()
        labal = UILabel(frame: CGRect(x: 300, y: 400, width: 200, height: 40))

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
        botton.backgroundColor = UIColor.systemPurple
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
       
        return botton
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(interest)
        view.addSubview(calculation)
        view.addSubview(interestLabal)
        view.addSubview(bottonCalculate)
        view.addSubview(calculationLabal)


        interest.delegate = self

        constrainsBottons()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    @objc func buttonPressed(_ sender: UIButton) {
        if let r = Double(interest.text!) {
            //show calculation
            calculation.text = String(double72(interest: r))
        }
    }
    
    func constrainsBottons(){
        
        bottonCalculate.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        bottonCalculate.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonCalculate.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonCalculate.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }

}

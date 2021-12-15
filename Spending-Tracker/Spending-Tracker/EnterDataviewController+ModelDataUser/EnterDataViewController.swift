//
//  EnterDataViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 05/05/1443 AH.
//

import UIKit
import CoreData

class EnterDataViewController: UIViewController {
    
//
//    let context = PersistentStorage.shared.context
//    let cdCapetil = CDCapetil()

    
    private var bottonNext : UIButton = {
        
        
      let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle("Next", for: [])
        botton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
    
        
       
        
      return botton
        
    }()
    
    private var accontLabal : UILabel = {
        let labal = UILabel()
        labal.text = "acount"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 3
        
        
        
        
        
        return labal
    }()
    private var nameAcountTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.cornerRadius = 0
        textField.placeholder = "account name..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    
    private var incomeNameLabal : UILabel = {
        let labal = UILabel()
        labal.text = "income"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        
        return labal
    }()
    
    private var incomeLabal : UILabel = {
        let labal = UILabel()
        labal.text = "income name"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        return labal
    }()
    private var incomeTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.cornerRadius = 0
        textField.placeholder = "income name..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var incomeEnterLabal : UILabel = {
        let labal = UILabel()
        labal.text = "Income"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        return labal
    }()
    private var incomeEnterTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.cornerRadius = 0
        textField.placeholder = "income..."
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var typeIncomeLabal : UILabel = {
        let labal = UILabel()
        labal.text = "Income Type"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        return labal
    }()
    private var typeIncomeTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.cornerRadius = 0
        textField.placeholder = "Income Type..."
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var incomeDateLabal : UILabel = {
        let labal = UILabel()
        labal.text = "Date"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        return labal
    }()
    private var incomeDatepiker : UIDatePicker = {
        var datepiker = UIDatePicker()
        datepiker.translatesAutoresizingMaskIntoConstraints = false
        datepiker.layer.cornerRadius = 0
        datepiker = UIDatePicker(frame: CGRect(x: 120, y: 380, width: 120, height: 60))
        return datepiker
    }()
    /////////////
    ///
    ///
    ///
    
    
    
    private var spendingtLabal : UILabel = {
        let labal = UILabel()
        labal.text = "spendings"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        
        return labal
    }()
    
    private var spendingNameLabal : UILabel = {
        let labal = UILabel()
        labal.text = "spending name"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        return labal
    }()
    private var spendingTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.cornerRadius = 0
        textField.placeholder = "spending name..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var spendingEnterLabal : UILabel = {
        let labal = UILabel()
        labal.text = "Spending"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        return labal
    }()
    private var spendingEnterTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.cornerRadius = 0
        textField.placeholder = "spending..."
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var typeSpendingLabal : UILabel = {
        let labal = UILabel()
        labal.text = "spendingType"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 6
        
        
        
        
        return labal
    }()
    private var typeSpendingTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.layer.cornerRadius = 0
        textField.placeholder = "Spending Type..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var spendingDateLabal : UILabel = {
        let labal = UILabel()
        labal.text = "Date"
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        labal.layer.cornerRadius = 12
        
        
        
        
        return labal
    }()
    
    private var spendingDatepiker: UIDatePicker = {
        var datepiker = UIDatePicker()
        datepiker.translatesAutoresizingMaskIntoConstraints = false
        datepiker.layer.cornerRadius = 0
        datepiker = UIDatePicker(frame: CGRect(x: 120, y: 690, width: 120, height: 80))
        return datepiker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .link
        
        view.addSubview(accontLabal)
        view.addSubview(nameAcountTextField)
        
        
        view.addSubview(incomeNameLabal)
        
        view.addSubview(incomeLabal)
        view.addSubview(incomeTextField)
        
        view.addSubview(incomeEnterLabal)
        view.addSubview(incomeEnterTextField)
        
        view.addSubview(typeIncomeLabal)
        view.addSubview(typeIncomeTextField)
        
        view.addSubview(incomeDateLabal)
        view.addSubview(incomeDatepiker)
        
       
        view.addSubview(spendingtLabal)
        
        
        view.addSubview(spendingNameLabal)
        view.addSubview(spendingTextField)
        
        view.addSubview(spendingEnterLabal)
        view.addSubview(spendingEnterTextField)
        
        view.addSubview(typeSpendingLabal)
        view.addSubview(typeSpendingTextField)
        
        view.addSubview(spendingDateLabal)
        view.addSubview(spendingDatepiker)
        
        
        view.addSubview(bottonNext)
        
        constraintsView()
        
    }
    
   
    
    
    @objc func buttonNextAction(sender: UIButton!) {
           print("Button tapped")
        
        performSegue(withIdentifier: "", sender: nil)
       
       }
}
    
extension EnterDataViewController {
    
    func constraintsView() {
        
        
        accontLabal.translatesAutoresizingMaskIntoConstraints = false
        accontLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        accontLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        accontLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        accontLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        nameAcountTextField.translatesAutoresizingMaskIntoConstraints = false
        nameAcountTextField.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameAcountTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        nameAcountTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10).isActive = true
        nameAcountTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        
        
        
        
        incomeNameLabal.translatesAutoresizingMaskIntoConstraints = false
        incomeNameLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        incomeNameLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        incomeNameLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        incomeNameLabal.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        
        incomeLabal.translatesAutoresizingMaskIntoConstraints = false
        incomeLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 180).isActive = true
        incomeLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        incomeLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        incomeLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        incomeTextField.translatesAutoresizingMaskIntoConstraints = false
        incomeTextField.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 180).isActive = true
        incomeTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        incomeTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10).isActive = true
        incomeTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        
        
        
        incomeEnterLabal.translatesAutoresizingMaskIntoConstraints = false
        incomeEnterLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 230).isActive = true
        incomeEnterLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        incomeEnterLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        incomeEnterLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        incomeEnterTextField.translatesAutoresizingMaskIntoConstraints = false
        incomeEnterTextField.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 230).isActive = true
        incomeEnterTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        incomeEnterTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10).isActive = true
        incomeEnterTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        
        
        
        typeIncomeLabal.translatesAutoresizingMaskIntoConstraints = false
        typeIncomeLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 280).isActive = true
        typeIncomeLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        typeIncomeLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        typeIncomeLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        typeIncomeTextField.translatesAutoresizingMaskIntoConstraints = false
        typeIncomeTextField.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 280).isActive = true
        typeIncomeTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        typeIncomeTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10).isActive = true
        typeIncomeTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
      
        
        
        
        
        incomeDateLabal.translatesAutoresizingMaskIntoConstraints = false
        incomeDateLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 330).isActive = true
        incomeDateLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        incomeDateLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        incomeDateLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        
        spendingtLabal.translatesAutoresizingMaskIntoConstraints = false
        spendingtLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 410).isActive = true
        spendingtLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        spendingtLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        spendingtLabal.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        
        
        
        spendingNameLabal.translatesAutoresizingMaskIntoConstraints = false
        spendingNameLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 490).isActive = true
        spendingNameLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        spendingNameLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        spendingNameLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        spendingTextField.translatesAutoresizingMaskIntoConstraints = false
        spendingTextField.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 490).isActive = true
        spendingTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        spendingTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10).isActive = true
        spendingTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        
        
        
        spendingEnterLabal.translatesAutoresizingMaskIntoConstraints = false
        spendingEnterLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 540).isActive = true
        spendingEnterLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        spendingEnterLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        spendingEnterLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        spendingEnterTextField.translatesAutoresizingMaskIntoConstraints = false
        spendingEnterTextField.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant:540).isActive = true
        spendingEnterTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        spendingEnterTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10).isActive = true
        spendingEnterTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        
        
        
        
        typeSpendingLabal.translatesAutoresizingMaskIntoConstraints = false
        typeSpendingLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 590).isActive = true
        typeSpendingLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        typeSpendingLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        typeSpendingLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        typeSpendingTextField.translatesAutoresizingMaskIntoConstraints = false
        typeSpendingTextField.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 590).isActive = true
        typeSpendingTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        typeSpendingTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10).isActive = true
        typeSpendingTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 120).isActive = true
        
        
        
        
        
        spendingDateLabal.translatesAutoresizingMaskIntoConstraints = false
        spendingDateLabal.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 640).isActive = true
        spendingDateLabal.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        spendingDateLabal.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        spendingDateLabal.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        
        
        
        
        
        bottonNext.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        bottonNext.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        bottonNext.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonNext.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
//        bottonNext.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
        

        
    }
    
}
    
    



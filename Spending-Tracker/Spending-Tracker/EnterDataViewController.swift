//
//  EnterDataViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 05/05/1443 AH.
//

import UIKit

class EnterDataViewController: UIViewController {

    private var accountNameTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField = UITextField(frame: CGRect(x: 100, y: 80, width: 200, height: 40))
        textField.keyboardType = .default
        textField.layer.cornerRadius = 6
        textField.placeholder = "account name..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private let tableView : UITableView = {
       
        let tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        
        view.addSubview(accountNameTextField)

       
    }
    

    

}

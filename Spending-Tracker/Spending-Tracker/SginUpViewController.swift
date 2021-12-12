//
//  SginUpViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 05/05/1443 AH.
//

import UIKit
import FirebaseAuth

class SginUpViewController: UIViewController {

    
    private var emailTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField = UITextField(frame: CGRect(x: 20, y: 300, width: 350, height: 40))
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 6
        textField.placeholder = "email..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var passwordTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField = UITextField(frame: CGRect(x: 20, y: 380, width: 350, height: 40))
        textField.keyboardType = .default
        textField.layer.cornerRadius = 6
        textField.placeholder = "password..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var PhonTextField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField = UITextField(frame: CGRect(x: 20, y: 460, width: 350, height: 40))
        textField.keyboardType = .phonePad
        textField.layer.cornerRadius = 6
        textField.placeholder = "phon number..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    
    private var bottonNext : UIButton = {
        
        
      let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle("Next", for: [])
        botton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
    
        
       
        
      return botton
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        view.addSubview(passwordTextField)
        view.addSubview(emailTextField)
        view.addSubview(PhonTextField)
        view.addSubview(bottonNext)
        constrainsBottons()
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            print(user.email ?? "email")
        }
    }
        func constrainsBottons(){
            
            
            bottonNext.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
            bottonNext.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
            bottonNext.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
            bottonNext.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            bottonNext.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
        }
        
    @objc func buttonNextAction(sender: UIButton!) {
           print("Button tapped")
        SignUp(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", phone: PhonTextField.text ?? "")
       }
    
    func SignUp(email: String,password:String,phone:String) {

            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in

                print("email:\(String(describing: authResult?.user.email))")
                print("uid:\(String(describing: authResult?.user.uid))")

                UserApi.addUser(uid:authResult?.user.uid ?? "" , phone: phone,email: email) { check in
                    if check {
                        print("Done saving in Database")
                    } else {

                    }
                }
            }



}
    
}



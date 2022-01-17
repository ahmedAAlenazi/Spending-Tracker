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
        textField = UITextField(frame: CGRect(x: 20, y: 400, width: 350, height: 40))
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 6
        textField.placeholder = NSLocalizedString("email...", comment: "")
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
        textField = UITextField(frame: CGRect(x: 20, y: 460, width: 350, height: 40))
        textField.keyboardType = .default
        textField.layer.cornerRadius = 6
        textField.placeholder = NSLocalizedString("password...", comment: "")
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
        textField = UITextField(frame: CGRect(x: 20, y: 520, width: 350, height: 40))
        textField.keyboardType = .phonePad
        textField.layer.cornerRadius = 6
        textField.placeholder = NSLocalizedString("phon number...", comment: "")
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    
    private var bottonNext : UIButton = {
        
        
        var botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Sign up", comment: ""), for: [])
        botton.backgroundColor = .black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
//        botton = UIButton(frame: CGRect(x: 20, y: 500, width: 200, height: 40))
        
       
        
      return botton
        
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemIndigo.withAlphaComponent(0.8)
        
        
        view.addSubview(passwordTextField)
        view.addSubview(emailTextField)
        view.addSubview(PhonTextField)
        view.addSubview(bottonNext)
        constrainsBottons()
//        
//        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
//            print(user.email ?? "email")
//        }
    }
        func constrainsBottons(){
            
            
            bottonNext.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
            bottonNext.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
            bottonNext.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
            bottonNext.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            bottonNext.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
        }
        
    @objc func buttonNextAction(sender: UIButton!) {
        
           print("Button tapped")
        
        if emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty && PhonTextField.text!.isEmpty {
            
            self.showAlert(withTitel: "faild", messege: "re-enter email, password and phone number", isLogin:false)
        
    }else{
        
        SignUp(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", phone: PhonTextField.text ?? "")
        
    }
 
    }

    
    func SignUp(email: String,password:String,phone:String) {

          Auth.auth().createUser(withEmail: email, password: password) { authResult, error in

                
                if let error = error {
                    self.showAlert(withTitel: "please write your email, password and phone number ", messege: "re-enter email, password and phone number", isLogin: false)
                    print(error.localizedDescription)
                }
                
                if authResult?.user.email != nil {
                    //perform segue
                    self.performSegue(withIdentifier: "toEnterDataViewController", sender: nil)

                    
                }
                print("email:\(String(describing: authResult?.user.email))")
                print("uid:\(String(describing: authResult?.user.uid))")

                UserApi.addUser(uid:authResult?.user.uid ?? "" , phone: phone,email: email) { check in
                    
                    if check {
                        
                        self.showAlert(withTitel: "sucsses", messege: "enjoy", isLogin: true)
                        
                        
                        print("Done saving in Database")
                    } else {
                        
                        
                        }
                    
                    }
                
                }
        
            }




    
    func showAlert (withTitel titel:String,messege:String,isLogin:Bool){
        let alert = UIAlertController(title: "Attention", message: messege, preferredStyle: .alert)
        let okAcction = UIAlertAction(title: "ok", style: .default, handler: { action in if isLogin {
            
            
            
        }else{
            
        }
            
        })
        
        alert.addAction(okAcction)
        self.present(alert,animated: true)
    }

}




//
//  ViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 03/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SiginInViewController: UIViewController {
    
    private var emailTextField : UITextField = {
            var textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField = UITextField(frame: CGRect(x: 20, y: 430, width: 350, height: 40))
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
        textField = UITextField(frame: CGRect(x: 20, y: 500, width: 350, height: 40))
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
    
    private let bottonSignIn : UIButton = {
        
        
      let botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("SignIn", comment: ""), for: [])
        botton.backgroundColor = .black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        
        
       
        
      return botton
        
    }()
    
    private let bottonSignUp : UIButton = {
        
      let botton = UIButton()
        
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("You dont't have an account?", comment: ""), for: [])
//        botton.backgroundColor = UIColor.lightGray.withAlphaComponent(0)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        
        
       
        
      return botton
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        view.addSubview(passwordTextField)
        view.addSubview(emailTextField)
        view.addSubview(bottonSignIn)
        view.addSubview(bottonSignUp)
//        view.backgroundColor =  UIColor.systemIndigo.withAlphaComponent(0.8)
        constrainsBottons()
        
        
        
    }
    
   
    func constrainsBottons(){
        
        bottonSignIn.center = self.view.center
    
//        bottonSignIn.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true// centerXAnchor which set over the view center
        bottonSignIn.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true // BottomAnchor to set with botton target
        bottonSignIn.widthAnchor.constraint(equalToConstant: 120.0).isActive = true // Width Anchor to set appropriate width
        bottonSignIn.heightAnchor.constraint(equalToConstant: 40.0).isActive = true // Height Anchor to set appropriate hegiht of the button.
        bottonSignIn.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        bottonSignIn.addTarget(self, action: #selector(buttonSignInAction), for: .touchUpInside)
        
        bottonSignUp.center = self.view.center
        
//        bottonSignUp.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true// centerXAnchor which set over the view center
        bottonSignUp.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true // BottomAnchor to set with botton target
        bottonSignUp.widthAnchor.constraint(equalToConstant: 300).isActive = true // Width Anchor to set appropriate width
        bottonSignUp.heightAnchor.constraint(equalToConstant: 40.0).isActive = true // Height Anchor to set appropriate hegiht of the button.
        bottonSignUp.rightAnchor.constraint(equalTo:self.view.centerXAnchor,constant: 150).isActive = true
        bottonSignUp.addTarget(self, action: #selector(buttonSignUpAction), for: .touchUpInside)
        
        
        
        
        
        }
     
    @objc func buttonSignInAction(sender: UIButton!) {
        print("Button tapped")
        SignIn(email: emailTextField.text ?? "", password: passwordTextField.text ?? "" )

    }
    
    @objc func buttonSignUpAction(sender: UIButton!) {
        print("Button tapped")
        performSegue(withIdentifier: "toSginUp", sender: nil)
    }
    
    func SignIn(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                self.showAlert(withTitel: "please check your password and email", messege: "re-enter email and password", isLogin: false)
                print(error.localizedDescription)
            }
            if let error = error {
                self.showAlert(withTitel: "please check your password and email", messege: "re-enter email and password", isLogin: false)
                print(error.localizedDescription)
            }
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            // ...
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
    
       
        
    




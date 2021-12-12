//
//  Model.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 05/05/1443 AH.
//

import Foundation
import FirebaseFirestore

class UserApi {
    
    static func addUser(uid:String,phone:String,email:String,completion: @escaping (Bool) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        
        refUsers.document(uid).setData(User.CreateUser(phone: phone,email: email))
        
        completion(true)
        
    }
    static func getUser(uid:String,completion: @escaping (User) -> Void) {
       
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }
        
    }
}

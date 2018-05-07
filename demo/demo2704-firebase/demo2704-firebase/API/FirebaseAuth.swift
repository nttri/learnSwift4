//
//  FirbaseAuth.swift
//  demo2704-firebase
//
//  Created by CPU12131 on 5/4/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

protocol AlertDelegate: class {
    func showAlert(_ title:String?,_ content:String?)
}

class FirebaseAuthAPI{
    
    weak var delegate: AlertDelegate?
    
    //MARK - create account method
    func createAccount(_ email:String,_ password: String, screen:UIViewController){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil{
                self.delegate?.showAlert("SUCCESSFULLY REGISTERED!", "")
                print("Register succeed")
            }else{
                self.delegate?.showAlert("WARNING!", error?.localizedDescription)
                print("Register failed")
            }
        }
    }
    
    //MARK - login method
    func login(_ email:String,_ password: String, screen:UIViewController){
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                screen.performSegue(withIdentifier: "loginSegue", sender: self)
                UserDefaults.standard.set(email, forKey: "Email")
                UserDefaults.standard.set(password, forKey: "Password")
                print("Login success")
            }else{
                self.delegate?.showAlert("WARNING!", error?.localizedDescription)
                print("Login failed")
            }
        })
    }
    
    //MARK - logout method
    func logout(){
        do{
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "Email")
            UserDefaults.standard.removeObject(forKey: "Password")
            //UserDefaults.standard.set(email, forKey: "Email")
            //UserDefaults.standard.set(password, forKey: "Password")
            print("Logout success")
        } catch {
            print("logout error catched")
            return
        }
    }
    
}

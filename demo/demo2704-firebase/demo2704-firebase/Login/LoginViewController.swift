//
//  LoginViewController.swift
//  demo2704-firebase
//
//  Created by CPU12131 on 4/27/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,AlertDelegate {
    
    var screenHeight:CGFloat = 0
    let firebaseAuth = FirebaseAuthAPI()
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func registerTouched(_ sender: Any) {
        let email:String? = emailField.text
        let password:String? = passwordField.text
        firebaseAuth.createAccount(email!,password!, screen: self)
    }
    
    @IBAction func loginTouched(_ sender: Any) {
        let email:String? = emailField.text
        let password:String? = passwordField.text
        firebaseAuth.login(email!, password!, screen: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseAuth.delegate = self
        autoLogin()
        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func updateUI(){
        self.screenHeight = UIScreen.main.bounds.height
        appTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: self.screenHeight*0.22).isActive = true
        emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: self.screenHeight*0.55).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue"{
            let viewController = segue.destination as! HomeViewController
            viewController.firebaseAuth = firebaseAuth
        }
    }
    
    // auto signin if the user account still active
    func autoLogin(){
        if let email = UserDefaults.standard.value(forKey: "Email") as? String, let password = UserDefaults.standard.value(forKey: "Password") as? String{
            print(email)
            firebaseAuth.login(email, password, screen: self)
        }
    }
    
    // add unwind segue
    @IBAction func backToHome(segue: UIStoryboardSegue){}

    // implement protocol
    func showAlert(_ title: String?, _ content: String?) {
        let alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}


//
//  ViewController.swift
//  demo2704-firebase
//
//  Created by CPU12131 on 4/27/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var screenHeight:CGFloat = 0
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func registerTouched(_ sender: Any) {
        
        let email:String? = emailField.text
        let password:String? = passwordField.text
        
        Auth.auth().createUser(withEmail: email!, password: password!, completion: {(user,error) in
            if error != nil {
                print("register failed")
            }else{
                print("register completed")
            }
        })
    }
    
    @IBAction func loginTouched(_ sender: Any) {
        
        let email:String? = emailField.text
        
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://www.example.com")
        // The sign-in operation has to always be completed in the app.
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        actionCodeSettings.setAndroidPackageName("com.example.android", installIfNotAvailable: false, minimumVersion: "12")
        
        Auth.auth().sendSignInLink(toEmail: email!, actionCodeSettings: actionCodeSettings)
        { error in
            if error != nil {
                print("Log in success")
            }else{
                print("Log in failed")
            }
            UserDefaults.standard.set(email, forKey: "Email")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateUI(){
        self.screenHeight = UIScreen.main.bounds.height
        
        appTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: self.screenHeight*0.22).isActive = true
        emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: self.screenHeight*0.55).isActive = true
    }

}


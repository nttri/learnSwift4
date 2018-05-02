//
//  ViewController.swift
//  demo2704-firebase
//
//  Created by CPU12131 on 4/27/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    var screenHeight:CGFloat = 0
    lazy var gEmail:String = ""
    lazy var gPassword:String = ""
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func registerTouched(_ sender: Any) {
        
        let email:String? = emailField.text
        let password:String? = passwordField.text
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
            if error == nil{
                let alert = UIAlertController(title: "SUCCESSFULLY REGISTERED!", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("Register succeed")
            }else{
                let alert = UIAlertController(title: "WARNING!", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("Register failed")
            }
        }
    }
    
    @IBAction func loginTouched(_ sender: Any) {
        
        let email:String? = emailField.text
        let password:String? = passwordField.text
        
        Auth.auth().signIn(withEmail: email!, password: password!, completion: { (user, error) in
            if error == nil {
                //let alert = UIAlertController(title: "SUCCESSFULLY LOGIN!", message: nil, preferredStyle: .alert)
                //alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                //self.present(alert, animated: true)
                self.gEmail = email!
                self.gPassword = password!
                self.performSegue(withIdentifier: "loginSegue", sender: self)
                print("Login success")
            }else{
                let alert = UIAlertController(title: "WARNING!", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("Login failed")
            }
            UserDefaults.standard.set(email, forKey: "Email")
        })
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue"{
            let viewController = segue.destination as! MainViewController
            viewController.currentUserEmail = gEmail
            viewController.currentUserPassword = gPassword
        }
    }

}


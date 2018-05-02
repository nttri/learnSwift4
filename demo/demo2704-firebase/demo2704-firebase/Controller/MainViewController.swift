//
//  MainViewController.swift
//  demo2704-firebase
//
//  Created by CPU12131 on 5/2/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var currentUserEmail:String? = nil
    var currentUserPassword:String? = nil
    var screenWidth:CGFloat = 0
    var leftMenuWidth:CGFloat = 0
    
    @IBOutlet weak var leftMenu: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var leftViewConstrant: NSLayoutConstraint!
    
    @IBAction func logoutTouched(_ sender: Any) {
        performSegue(withIdentifier: "logoutSegue", sender: self)
        print("Logout success")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI(){
        self.screenWidth = UIScreen.main.bounds.width
        leftMenu.layer.shadowOpacity = 0.4
        leftMenu.layer.shadowOffset = CGSize(width: 5, height: 3)
        leftMenuWidth = screenWidth * 0.4
        leftViewConstrant.constant = leftMenuWidth * -1
    }
    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        print("-------")
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            print(translation)
            if(translation > 0){    // swipe right
                if leftViewConstrant.constant < 20 {
                    
                }
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

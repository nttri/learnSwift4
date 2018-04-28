//
//  ViewController.swift
//  demo2704-firebase
//
//  Created by CPU12131 on 4/27/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var screenHeight:CGFloat = 0
    
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
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


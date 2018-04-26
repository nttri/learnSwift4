//
//  LoadScreenViewController.swift
//  demo24042018
//
//  Created by CPU12131 on 4/24/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class LoadScreenViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loadingBar: UIProgressView!
    var loadingValue:Int = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(updateLoadingBar), userInfo: nil, repeats: true)
        logo.layer.cornerRadius = logo.bounds.width / 2
        logo.layer.masksToBounds = true
    }
    
    @objc func updateLoadingBar(){
        loadingValue += 1
        if loadingValue == 100 {
            performSegue(withIdentifier: "showMainViewSegue", sender: self)
            timer?.invalidate()
            timer = nil
        }
        loadingBar.setProgress(Float(loadingValue)/100, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

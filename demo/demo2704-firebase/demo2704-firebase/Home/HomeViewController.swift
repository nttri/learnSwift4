//
//  HomeViewController
//  demo2704-firebase
//
//  Created by CPU12131 on 5/2/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit
import Darwin

class HomeViewController: UIViewController {

    var firebaseAuth:FirebaseAuthAPI!
    var screenWidth:CGFloat = 0
    var leftMenuWidth:CGFloat = 0
    var panGestureRecognizer: UIPanGestureRecognizer!
    
    @IBOutlet weak var leftMenu: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var leftViewConstrant: NSLayoutConstraint!
    
    @IBAction func logoutTouched(_ sender: Any) {
        firebaseAuth.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(showLeftMenu(sender:)))
        view.addGestureRecognizer(panGestureRecognizer)

        updateUI()
    }
    
    func updateUI(){
        self.screenWidth = UIScreen.main.bounds.width
        leftMenu.layer.shadowOpacity = 0.4
        leftMenu.layer.shadowOffset = CGSize(width: 5, height: 3)
        leftMenuWidth = screenWidth * 0.4
        leftViewConstrant.constant = leftMenuWidth * -1
    }
    
    @objc func showLeftMenu(sender: UIPanGestureRecognizer) {

        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            //print(translation)
            if(translation > 0){    // swipe right
                if leftViewConstrant.constant < 1 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.leftViewConstrant.constant += translation/5
                        self.view.layoutIfNeeded()
                        })
                }
            }else{                  // swipe left
                if leftViewConstrant.constant > leftMenuWidth * -1{
                    UIView.animate(withDuration: 0.2, animations: {
                        self.leftViewConstrant.constant += translation/5
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }else if sender.state == .ended {
            
            if leftViewConstrant.constant < leftMenuWidth * -0.3{
                UIView.animate(withDuration: 0.2, animations: {
                    self.leftViewConstrant.constant = -1 * self.leftMenuWidth
                        self.view.layoutIfNeeded()
                    })
            }else{
                UIView.animate(withDuration: 0.2, animations: {
                    self.leftViewConstrant.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

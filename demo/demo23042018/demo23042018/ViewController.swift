//
//  ViewController.swift
//  demo23042018
//
//  Created by CPU12131 on 4/23/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var upLabel: UILabel!
    
    var g_str:String = ""
    var g_x1:Int64? = nil
    var g_operator:Character? = nil
    var g_x2:Int64? = nil
   
    @IBAction func numPressed(_ sender: UIButton) {
        if(myLabel.text == "" && sender.tag == 0){
            return
        }
        myLabel.text = myLabel.text! + String(sender.tag)
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
        if(myLabel.text == ""){
            return
        }
        if (sender.tag != 100) {
            g_x1 = Int64(myLabel.text!)!
        }
        if sender.tag == 101{   // add
            g_operator = "+"
            upLabel.text = myLabel.text! + "+"
            myLabel.text = ""
        }
        else if sender.tag == 102{   // sub
            g_operator = "-"
            upLabel.text = myLabel.text! + "-"
            myLabel.text = ""
        }
        else if sender.tag == 103{   // multi
            g_operator = "*"
            upLabel.text = myLabel.text! + "*"
            myLabel.text = ""
        }
        else if sender.tag == 104{   // devide
            g_operator = "/"
            upLabel.text = myLabel.text! + "/"
            myLabel.text = ""
        }
        else{   // calculate
            if(g_x1 != nil && g_operator != nil){
                g_x2 = Int64(myLabel.text!)!
                if g_operator == "+"{
                    myLabel.text = String(g_x1! + g_x2!)
                }else if g_operator == "-"{
                    myLabel.text = String(g_x1! - g_x2!)
                }else if g_operator == "*"{
                    myLabel.text = String(g_x1! * g_x2!)
                }else if g_operator == "/"{
                    print(g_x1! / g_x2!)
                    myLabel.text = String(g_x1! / g_x2!)
                }
                upLabel.text = String(g_x1!) + String(g_operator!) + String(g_x2!)
            }
        }
    }
    
    @IBAction func erasePressed(_ sender: UIButton) {
        if(sender.tag == 99){
            myLabel.text = ""
            upLabel.text = ""
        }else{
            var strTemp = myLabel.text!
            if strTemp == ""{
                return
            }
            strTemp.removeLast()
            myLabel.text = strTemp
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


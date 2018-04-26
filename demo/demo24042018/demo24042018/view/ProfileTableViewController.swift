//
//  ProfileTableViewController.swift
//  demo24042018
//
//  Created by NguyenThanhTri on 4/26/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var avaImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        avaImage.layer.cornerRadius = avaImage.bounds.width / 2
        avaImage.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}

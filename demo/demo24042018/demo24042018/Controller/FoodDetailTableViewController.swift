//
//  FoodDetailTableViewController.swift
//  demo24042018
//
//  Created by CPU12131 on 4/27/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class FoodDetailTableViewController: UITableViewController {

    var gFood:Food?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
        //RECIEVED DATA
        self.image.image = gFood?.foodImage
        self.nameLabel.text = gFood?.foodName
        self.descriptionTextView.text = gFood?.foodDescription
        switch gFood?.foodRating {
        case 1:
            self.ratingLabel.text = "⭐️"
        case 2:
            self.ratingLabel.text = "⭐️⭐️"
        case 3:
            self.ratingLabel.text = "⭐️⭐️⭐️"
        case 4:
            self.ratingLabel.text = "⭐️⭐️⭐️⭐️"
        default:
            self.ratingLabel.text = "⭐️⭐️⭐️⭐️⭐️"
        }
        
        // ROUNDED IMAGE
        let min = self.image.bounds.width > self.image.bounds.height ? self.image.bounds.height : self.image.bounds.width
        self.image.layer.cornerRadius = min / 2
        self.image.layer.masksToBounds = true
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

}

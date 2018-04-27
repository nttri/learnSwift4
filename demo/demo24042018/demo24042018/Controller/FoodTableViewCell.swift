//
//  FoodTableViewCell.swift
//  demo24042018
//
//  Created by CPU12131 on 4/27/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    var gFood:Food!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        foodImage.image = gFood.foodImage!
        nameLabel.text = gFood.foodName
        switch gFood.foodRating! {
        case 1:
            ratingLabel.text = "⭐️"
        case 2:
            ratingLabel.text = "⭐️⭐️"
        case 3:
            ratingLabel.text = "⭐️⭐️⭐️"
        case 4:
            ratingLabel.text = "⭐️⭐️⭐️⭐️"
        default:
            ratingLabel.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

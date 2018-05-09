//
//  NewsTableViewCell.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/9/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeader: UITextView!
    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsViewsCount: UILabel!
    @IBOutlet weak var newsViewsIcon: UIImageView!
    
    func set(){
        newsImageView.image = UIImage(named: "news")
        newsHeader.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        newsSource.text = "Zing - 3 giờ trước"
        newsViewsCount.text = "99"
        newsViewsIcon.isHidden = false
    }

}

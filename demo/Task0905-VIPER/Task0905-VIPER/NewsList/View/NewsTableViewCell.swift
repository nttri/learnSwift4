//
//  NewsTableViewCell.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/9/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeader: UITextView!
    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsViewsCount: UILabel!
    @IBOutlet weak var newsViewsIcon: UIImageView!
    
    func set(news: NewsModel){
        
        let loadingImage = UIImage(named: "sand-clock")
        let url = URL(string: news.smallImage)!
        newsImageView.af_setImage(withURL: url, placeholderImage: loadingImage)
        newsHeader.text = news.header
        newsSource.text = news.source
        
        if news.views == 0 {
            newsViewsCount.text = ""
            newsViewsIcon.isHidden = true
        }else{
            newsViewsCount.text = "\(news.views)"
            newsViewsIcon.isHidden = false
        }
    }

}

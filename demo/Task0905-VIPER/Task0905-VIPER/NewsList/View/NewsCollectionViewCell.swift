//
//  NewsCollectionViewCell.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/14/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var header: UITextView!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var views: UILabel!
    @IBOutlet weak var viewsIcon: UIImageView!
    
    func set(news: NewsModel){
        let loadingImage = UIImage(named: "sand-clock")
        let url = URL(string: news.smallImage)!
        image.af_setImage(withURL: url, placeholderImage: loadingImage)
        header.text = news.header
        source.text = news.source
        
        if news.views == 0 {
            views.text = ""
            viewsIcon.isHidden = true
        }else{
            views.text = "\(news.views)"
            viewsIcon.isHidden = false
        }
    }
}

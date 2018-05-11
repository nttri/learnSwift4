//
//  NewsDetailView.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class NewsDetailView: UIViewController {
    
    var presenter: NewsDetailPresenterProtocol?

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension NewsDetailView: NewsDetailViewProtocol{
    
    func showDetailNews(forNews news: NewsModel) {
        let loadingImage = UIImage(named: "sand-clock")
        let url = URL(string: news.largeImage)!
        imageView.af_setImage(withURL: url, placeholderImage: loadingImage)
        headerLabel.text = news.header
        sourceLabel.text = news.source
        contentLabel.text = news.content
    }
}

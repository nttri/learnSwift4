//
//  NewsDetailRouter.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailRouter: NewsDetailRouterProtocol{
    
    static var mainStoryboard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func getNewsDetailViewModule(forNews news: NewsModel) -> UIViewController {
        
        let newsDetailVC = mainStoryboard.instantiateViewController(withIdentifier: "NewsDetailView")
        if let view = newsDetailVC as? NewsDetailView{
            let presenter = NewsDetailPresenter()
            let router = NewsDetailRouter()
            
            presenter.router = router
            presenter.view = view
            presenter.news = news
            view.presenter = presenter
            
            return newsDetailVC
        }
        
        return UIViewController()
    }
    

}

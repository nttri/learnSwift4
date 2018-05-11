//
//  NewsListRouter.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation
import UIKit

class NewsListRouter: NewsListRouterProtocol{
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func getNewsListView1Module() -> UIViewController {
        
        let navVC = mainStoryboard.instantiateViewController(withIdentifier: "navViewController1")
        if let firstTabView = navVC.childViewControllers.first as? News1View {
            let presenter = NewsListPresenter()
            let interactor = NewsListInteractor()
            let router = NewsListRouter()
            let localDataManager = NewsListLocalDataManager()
            
            firstTabView.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = firstTabView
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
            
            return navVC
        }
        
        return UIViewController()
    }
    
    func presentNewsDetailScreen(from view: NewsListViewProtocol, forNews news: NewsModel) {
        let newsDetailView = NewsDetailRouter.getNewsDetailViewModule(forNews: news)
        
        if let sourceView = view as? UIViewController{
            sourceView.navigationController?.pushViewController(newsDetailView, animated: true)
        }
    }
    
    
}

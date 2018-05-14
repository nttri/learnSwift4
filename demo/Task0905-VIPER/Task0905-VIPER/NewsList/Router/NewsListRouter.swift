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
    
    static func getTabbarModule() -> UIViewController {
        
        let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "RootTabbar") as! UITabBarController
        let navigationController1 = tabBarController.childViewControllers.first as! UINavigationController
        let navigationController2 = tabBarController.childViewControllers[1] as! UINavigationController
        
        if let firstTabView = navigationController1.childViewControllers.first as? News1View,
            let secondTabView = navigationController2.childViewControllers.first as? News2View {
            
            let presenter = NewsListPresenter()
            let interactor = NewsListInteractor()
            let router = NewsListRouter()
            let localDataManager = NewsListLocalDataManager()
            
            firstTabView.presenter = presenter
            secondTabView.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view1 = firstTabView
            presenter.view2 = secondTabView
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
            
            return tabBarController
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

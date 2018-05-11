//
//  NewsListProtocol.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation
import UIKit

protocol NewsListViewProtocol: class {
    var presenter: NewsListPresenterProtocol? {get set}
    
    // PRESENTER --> VIEW
    func showAllNews(with allNews:[NewsModel])
}

protocol NewsListPresenterProtocol: class {
    var view: NewsListViewProtocol? {get set}
    var router: NewsListRouterProtocol? {get set}
    var interactor: NewsListInteractorInputProtocol? {get set}
    
    // VIEW --> PRESENTER
    func viewDidLoad()
    func viewNewsDetail(forNews news:NewsModel)
}

protocol NewsListRouterProtocol: class {
    static func getNewsListView1Module() -> UIViewController
    
    // PRESENTER --> ROUTER
    func presentNewsDetailScreen(from view: NewsListViewProtocol, forNews news: NewsModel)
}

protocol NewsListInteractorInputProtocol: class {
    var presenter: NewsListInteractorOutputProtocol? {get set}
    var localDataManager: NewsListLocalDataManagerInputProtocol? {get set}
    
    // PRESENTER --> INTERACTOR
    func getNewsList()
}

protocol NewsListInteractorOutputProtocol: class {
    // INTERACTOR --> PRESENTER
    func didReceivedNewsList(_ newsList: [NewsModel])
}

protocol NewsListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func getNewsList() -> [NewsModel]
}

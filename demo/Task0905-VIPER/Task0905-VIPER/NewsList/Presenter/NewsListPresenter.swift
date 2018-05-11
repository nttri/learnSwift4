//
//  NewsListPresenter.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation

class NewsListPresenter: NewsListPresenterProtocol{
    
    var view: NewsListViewProtocol?
    var router: NewsListRouterProtocol?
    var interactor: NewsListInteractorInputProtocol?
    
    func viewDidLoad() {
        interactor?.getNewsList()
    }
    
    func viewNewsDetail(forNews news: NewsModel) {
        router?.presentNewsDetailScreen(from: view!, forNews: news)
    }
}

extension NewsListPresenter: NewsListInteractorOutputProtocol{
    
    func didReceivedNewsList(_ newsList: [NewsModel]) {
        view?.showAllNews(with: newsList)
    }
}

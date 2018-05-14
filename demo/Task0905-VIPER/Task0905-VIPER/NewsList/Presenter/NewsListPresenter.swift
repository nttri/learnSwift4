//
//  NewsListPresenter.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation

class NewsListPresenter: NewsListPresenterProtocol{
    
    var view1: NewsListViewProtocol?
    var view2: NewsListViewProtocol?
    var router: NewsListRouterProtocol?
    var interactor: NewsListInteractorInputProtocol?
    
    func viewDidLoad() {
        interactor?.getNewsList()
    }
    
    func viewNewsDetailFromTab1(forNews news: NewsModel) {
        router?.presentNewsDetailScreen(from: view1!, forNews: news)
    }

    func viewNewsDetailFromTab2(forNews news: NewsModel) {
        router?.presentNewsDetailScreen(from: view2!, forNews: news)
    }
}

extension NewsListPresenter: NewsListInteractorOutputProtocol{
    
    func didReceivedNewsList(_ newsList: [NewsModel]) {
        view1?.showAllNews(with: newsList)
        view2?.showAllNews(with: newsList)
    }
}

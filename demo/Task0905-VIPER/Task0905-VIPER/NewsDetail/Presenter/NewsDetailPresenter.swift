//
//  NewsDetailPresenter.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation

class NewsDetailPresenter: NewsDetailPresenterProtocol{
    
    var view: NewsDetailViewProtocol?
    var router: NewsDetailRouterProtocol?
    var news: NewsModel?
    
    func viewDidLoad() {
        view?.showDetailNews(forNews: news!)
    }
}

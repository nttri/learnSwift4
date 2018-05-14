//
//  NewsListInteractorInput.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation

class NewsListInteractor: NewsListInteractorInputProtocol{
    
    var presenter: NewsListInteractorOutputProtocol?
    var localDataManager: NewsListLocalDataManagerInputProtocol?
    
    func getNewsList() {
        guard let newsList = localDataManager?.getNewsList() else {
            print("GET DATA FROM FILE FAILED!")
            return
        }
        if newsList.count > 0 {
            presenter?.didReceivedNewsList(newsList)
        }
    }
}

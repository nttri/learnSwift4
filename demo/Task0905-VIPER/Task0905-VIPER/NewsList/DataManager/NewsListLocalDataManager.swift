//
//  NewsListLocalDataManagerInput.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation

class NewsListLocalDataManager: NewsListLocalDataManagerInputProtocol{
    
    func getNewsList() -> [NewsModel]{
        var newsList = [NewsModel]()
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let dictionary = object as? [String:AnyObject]{
                if let allNews = dictionary["news"]! as? NSMutableArray{
                    for news in allNews{
                        if let news = news as? [String:AnyObject]{
                            let eachNews = NewsModel(id: news["id"] as! Int,
                                                     header: news["header"] as! String,
                                                     content: news["content"] as! String,
                                                     smallImage: news["smallImage"] as! String,
                                                     largeImage: news["largeImage"] as! String,
                                                     source: news["source"] as! String,
                                                     views: news["views"] as! Int)
                            newsList.append(eachNews)
                        }
                    }
                }
            }
        } catch {
            print("--------ERROR--------")
        }
        
        return newsList
    }
}

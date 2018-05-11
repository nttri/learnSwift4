//
//  NewsDetailProtocols.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation
import UIKit

protocol NewsDetailViewProtocol: class{
    var presenter: NewsDetailPresenterProtocol? {get set}
    
    // PRESENTER --> VIEW
    func showDetailNews(forNews news: NewsModel)
}

protocol NewsDetailPresenterProtocol: class{
    var view: NewsDetailViewProtocol? {get set}
    var router: NewsDetailRouterProtocol? {get set}
    var news: NewsModel? {get set}
    
    // VIEW --> PRESENTER
    func viewDidLoad()
}

protocol NewsDetailRouterProtocol: class{
    static func getNewsDetailViewModule(forNews news: NewsModel) -> UIViewController
}

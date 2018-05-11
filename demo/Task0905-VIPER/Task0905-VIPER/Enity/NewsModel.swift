//
//  NewsModel.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/11/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation

class NewsModel{
    var id = 0
    var header = ""
    var content = ""
    var smallImage = ""
    var largeImage = ""
    var source = ""
    var views = 0
    
    init(id: Int, header: String, content: String, smallImage: String, largeImage: String, source: String, views: Int) {
        self.id = id
        self.header = header
        self.content = content
        self.smallImage = smallImage
        self.largeImage = largeImage
        self.source = source
        self.views = views
    }
}

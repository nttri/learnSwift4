//
//  Food.swift
//  demo24042018
//
//  Created by CPU12131 on 4/27/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import Foundation
import UIKit

class Food{
    var foodName: String?
    var foodDescription: String?
    var foodRating: Int?
    var imageName: String?
    var foodImage: UIImage?
    
    init(foodName: String?, foodDescription: String?, imageName: String?, foodRating: Int?) {
        self.foodName = foodName
        self.foodDescription = foodDescription
        self.imageName = imageName
        self.foodRating = foodRating
        self.foodImage = UIImage(named: imageName!)
    }
}

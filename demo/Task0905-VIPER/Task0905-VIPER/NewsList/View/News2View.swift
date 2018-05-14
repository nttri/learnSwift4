//
//  News2View.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/14/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class News2View: UIViewController {
    
    var newsList = [NewsModel]()
    var presenter: NewsListPresenterProtocol?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension News2View: NewsListViewProtocol{
    
    func showAllNews(with allNews: [NewsModel]) {
        newsList = allNews
    }
}

extension News2View: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        cell.set(news: newsList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.viewNewsDetailFromTab2(forNews: newsList[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 120)
    }
    
}

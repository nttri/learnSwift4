//
//  News1View.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/9/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class News1View: UIViewController {

    var newsList = [NewsModel]()
    var presenter: NewsListPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
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

extension News1View: NewsListViewProtocol{
    
    func showAllNews(with allNews: [NewsModel]) {
        newsList = allNews
    }
}

extension News1View: UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.set(news: newsList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.viewNewsDetailFromTab1(forNews: newsList[indexPath.row])
    }
}


//
//  News1View.swift
//  Task0905-VIPER
//
//  Created by CPU12131 on 5/9/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class News1View: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: config
    func updateUI(){
        tableView.rowHeight = 150
    }
    
    //MARK: logic

}

extension News1View: UITableViewDataSource, UITableViewDelegate{
    
    //MARK: datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.set()
        
        return cell
    }
    
    //MARK: delegate
}


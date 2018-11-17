//
//  MainTableViewController.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/16/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var beerList : [BeerVO] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        
        DataAgent.shared().getBeers(successCallback: callbackSuccessGetBeers)
    }
    
    func registerCell() {
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
    }
    
    func callbackSuccessGetBeers(beerList : [BeerVO]) {
        
        self.beerList = beerList
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.updateCell(beer: beerList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }

}

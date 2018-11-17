//
//  BeerViewController.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/17/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController {

    @IBOutlet weak var beerCollectionView: UICollectionView!
    
    var beerList : [BeerVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        beerCollectionView.dataSource = self
        beerCollectionView.delegate = self
        
        DataAgent.shared().getBeers(successCallback: callbackSuccessGetBeers)
    }
    
    func callbackSuccessGetBeers(beerList : [BeerVO]) {
        
        self.beerList = beerList
        self.beerCollectionView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BeerViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = beerCollectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as? BeerCollectionViewCell {
            cell.updateCell(beer: beerList[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}

extension BeerViewController : UICollectionViewDelegate {
    
}

//
//  BeerViewController.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/17/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import CoreData

class BeerViewController: UIViewController {

    @IBOutlet weak var beerCollectionView: UICollectionView!
    
    var beerList : [BeerVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        beerCollectionView.dataSource = self
        beerCollectionView.delegate = self
        
        registerForPreviewing(with: self, sourceView: beerCollectionView)
        
        self.beerList = BeerModel.shared().getBeerList()
        
        if self.beerList.isEmpty {
            DataAgent.shared().getBeers(successCallback: callbackSuccessGetBeers)
        } else {
            self.beerCollectionView.reloadData()
        }
    }
    
    func callbackSuccessGetBeers(beerList : [BeerVO]) {
        BeerModel.shared().saveBeerData(beerList: beerList)
        self.beerList = BeerModel.shared().getBeerList()
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected ==> \(indexPath.row)")
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        if let vc = vc {
            vc.beerData = beerList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("Error launching view controller.")
        }
    }
}

extension BeerViewController : UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = beerCollectionView.indexPathForItem(at: location), let cell = beerCollectionView.cellForItem(at: indexPath) else { return nil }
        
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return nil }
        vc.beerData = beerList[indexPath.row]
        
        previewingContext.sourceRect = cell.contentView.frame
        return vc
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
}

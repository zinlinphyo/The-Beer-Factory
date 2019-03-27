//
//  DetailViewController.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/18/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var beerData : BeerVO? = nil
    
    @IBOutlet weak var ivHeroImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let beerData = beerData {
            self.navigationController?.title = beerData.name
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let data = beerData else {
            return
        }
        
        lblName.text = data.name
        ivHeroImage.sd_setImage(with: URL(string: data.imageUrl ?? ""), placeholderImage: UIImage(named: "image_placeholder"))
        
        print("Ingredient ==> \(String(describing: data.ingredient))")
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

//
//  BeerCollectionViewCell.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/17/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import UIKit
import SDWebImage

class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivBeerProduct: UIImageView!
    @IBOutlet weak var lblBeerName: UILabel!
    @IBOutlet weak var lblBeerTagline: UILabel!
    
    func updateCell(beer data: BeerVO) {
        
        ivBeerProduct.sd_setImage(with: URL(string: data.imageUrl ?? ""), placeholderImage: UIImage(named: "image_placeholder"))
        
        lblBeerName.text = data.name
        
        lblBeerTagline.text = data.tagline
    }
}

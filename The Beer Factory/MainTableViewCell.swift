//
//  MainTableViewCell.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/16/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var ivBeer: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblTagline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(beer data: BeerVO) {
        
        ivBeer.sd_setImage(with: URL(string: data.imageUrl ?? ""), placeholderImage: UIImage(named: "image_placeholder"))
        
        lblName.text = data.name
        
        lblTagline.text = data.tagline
    }
    
}

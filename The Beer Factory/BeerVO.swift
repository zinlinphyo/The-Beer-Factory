//
//  BeerVO.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/17/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import Foundation
import SwiftyJSON

class BeerVO {
    
    var id : Int? = nil
    
    var name : String? = nil
    
    var imageUrl : String? = nil
    
    var tagline : String? = nil
    
    static func parseToBeerVO(_ data: JSON) -> BeerVO {
        
        let beer = BeerVO()
        beer.id = data["id"].int
        beer.name = data["name"].string
        beer.imageUrl = data["image_url"].string
        beer.tagline = data["tagline"].string
        
        return beer
    }
}

//
//  IngredientVO.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/24/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import Foundation
import SwiftyJSON

class IngredientVO {
    
    var malt : [MaltVO] = []
    
    static func parseToIngredientVO(_ data: JSON) -> IngredientVO {
        let ingrdient = IngredientVO()
        
        let maltArr = data["malt"].array
        maltArr?.forEach({ (data) in
            let malt = MaltVO.parseToMaltVO(data)
            ingrdient.malt.append(malt)
        })
        
        return ingrdient
    }
}

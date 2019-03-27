//
//  MaltVO.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/24/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import Foundation
import SwiftyJSON

class MaltVO {
    
    var name : String? = nil
    
    var amount : AmountVO? = nil
    
    static func parseToMaltVO(_ data: JSON) -> MaltVO {
        let malt = MaltVO()
        malt.name = data["name"].string
        malt.amount = AmountVO.parseToAmountVO(data["amount"])
        
        return malt
    }
}

//
//  AmountVO.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/24/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import Foundation
import SwiftyJSON

class AmountVO {
    
    var value : Double? = nil
    
    var unit : String? = nil
    
    static func parseToAmountVO(_ data: JSON) -> AmountVO {
        let amount = AmountVO()
        amount.value = data["value"].double
        amount.unit = data["unit"].string
        
        return amount
    }
}

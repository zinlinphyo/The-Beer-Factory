//
//  DataAgent.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/17/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class DataAgent {
    
    private let BASE_URL = "https://api.punkapi.com/v2/"
    
    private static var sharedNetworkManager: DataAgent = {
        let networkManager = DataAgent()
        return networkManager
    }()
    
    private init() {}
    
    class func shared() -> DataAgent {
        return sharedNetworkManager
    }
    
    func getBeers(successCallback: @escaping ([BeerVO]) -> Void) {
        
        Alamofire
            .request(BASE_URL + "beers", method: .get)
            .responseJSON { (response) in
                
            switch response.result {
                
                case .success:
                    let rawdata = response.result.value
                    
                    let json = JSON(rawdata!)
                    
                    let data = json.array
                    
                    if let result = data {
                        
                        var beerList : [BeerVO] = []
                        
                        result.forEach({ (beer) in
                            let beerVO = BeerVO.parseToBeerVO(beer)
                            
                            if let _ = beerVO.id {
                                beerList.append(BeerVO.parseToBeerVO(beer))
                            }
                        })
                        
                        successCallback(beerList)
                    }
                    break
                
                case .failure: print("fail network call")
                    break
            }
        }
    }
}

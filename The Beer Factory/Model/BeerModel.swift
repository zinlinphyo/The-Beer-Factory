//
//  BeerModel.swift
//  The Beer Factory
//
//  Created by Zin Lin Phyo on 11/24/18.
//  Copyright © 2018 Zin Lin Phyo. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class BeerModel {
    
    var beerList : [BeerVO] = []
    var beers : [Beer] = []
    
    var managedObjectContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private static var sharedBeerModel: BeerModel = {
        let beerModel = BeerModel()
        return beerModel
    }()
    
    private init() {}
    
    class func shared() -> BeerModel {
        return sharedBeerModel
    }
    
    func saveBeerData(beerList: [BeerVO]) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Beer", in: managedObjectContext)
        
        beerList.forEach { (beer) in
            let newBeer = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
            
            newBeer.setValue(beer.id, forKey: "id")
            newBeer.setValue(beer.name, forKey: "name")
            newBeer.setValue(beer.imageUrl, forKey: "image")
            newBeer.setValue(beer.tagline, forKey: "tagline")
            
            do {
                try managedObjectContext.save()
            } catch {
                print("Failed saving")
            }
        }
        
    }
    
    func getBeerList() -> [BeerVO] {
        
        do {
            self.beers = try managedObjectContext.fetch(Beer.fetchRequest()) as! [Beer]
            
            self.beers.forEach { (data) in
                var beer = BeerVO()
                beer.id = Int(data.id)
                beer.name = data.name
                beer.imageUrl = data.image
                beer.tagline = data.tagline
                self.beerList.append(beer)
            }
            return self.beerList
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return []
    }
}

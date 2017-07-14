//
//  PlacesViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

protocol PlaceViewModelDelegate: class {
    func didFetchItems()
}
class PlacesViewModel {
    
    var places :[Place] = [Place]()
    weak var delegate: PlaceViewModelDelegate?
    
    init(viewController: PlaceViewModelDelegate) {
        self.delegate = viewController
        
    }
    func fetchItems(){
       
            let listOfPlaces :NSArray = loadJson(filename: "placesList")!
            print(listOfPlaces)
            for dic in listOfPlaces
            {
                
                let newPlace =  Place(dic: dic as! NSDictionary)
                places.append(newPlace)
            }
        
            self.delegate?.didFetchItems()
        
    }
    
    func loadJson(filename fileName: String) -> NSArray?
    {
         let path = Bundle.main.path(forResource: fileName, ofType: "json")
        
                let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
                print(jsonData!)
               let jsonResult: NSArray = try! JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
               
                return jsonResult
        
        
    }
    
    
    
}

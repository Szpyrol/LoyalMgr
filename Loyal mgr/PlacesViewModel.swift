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
       
        API.sharedInstance.getPlaces(completion: {(places, error) in

            
            let listOfPlaces :NSArray = places! as NSArray
            
            for dic in listOfPlaces
            {
                
                let newPlace =  Place(dic: dic as! NSDictionary)
                self.places.append(newPlace)
            }
            
            self.delegate?.didFetchItems()
            
            
            
        })
        
        
        
     /*   API.sharedInstance.getUserData(completion: {(info, error) in
            
            
            print("lol works")
            
        })
       */
        
        /*let user = User(password:"passwordjakis" ,firstName: "fist", lastName: "last", email: "em", phone: "ph")
        API.sharedInstance.postUserData(user: user, completion: {(info, error) in
            
            
            print("lol post works")
            
        })
        */

        API.sharedInstance.getUserData(email: "szpyrol", password: "zwyrol", completion: {(info, error) in
            
            
            print("lol works")
            
        })
        
        
        
        
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

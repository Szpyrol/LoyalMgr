//
//  Service.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//
//http://www.optykexpert.pl/images/oe1.jpg
//https://salony-jeanlouisdavid.pl/wp-content/uploads/2016/12/fryzjer-warszawa_salon-jld-prosta-68_08.jpg
import Foundation

class Service: NSObject{
    
    var name: String?
    var serviceDescription: String?
    var price: Double?
    var imageUrl: String?
    
    var id:Int?
    var placeId: Int?
    
    
    
    init(dic: NSDictionary) {
        super.init()
        
        
        for (key, value) in dic {
            let keyName = key as! String
            if (keyName == "id")
            {
                let keyValue: Int = value as! Int
               self.id = keyValue
                
            }else if (keyName == "placeId"){
                let keyValue: Int = value as! Int
                self.placeId = keyValue
            }else{
                
                let keyValue: String = value as! String
            
                // If property exists
                if (responds(to: Selector(keyName))) {
                    self.setValue(keyValue, forKey: keyName)
                }
            }
        }
        
    }

    
    
}

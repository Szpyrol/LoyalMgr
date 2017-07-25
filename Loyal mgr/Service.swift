//
//  Service.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class Service: NSObject{
    
    var name: String?
    var serviceDescription: String?
    var price: Double?
    var imageUrl: String?
    
    
    init(dic: NSDictionary) {
        super.init()
        
        
        for (key, value) in dic {
            let keyName = key as! String
            let keyValue: String = value as! String
            
            // If property exists
            if (responds(to: Selector(keyName))) {
                self.setValue(keyValue, forKey: keyName)
            }
        }
        
    }

    
    
}

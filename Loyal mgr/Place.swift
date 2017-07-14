//
//  Place.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class Place: NSObject {

    var name: String?
    var imageUrl: String?
    
    init(dic: NSDictionary) {
        super.init()
     
        
        // Loop
        for (key, value) in dic {
            let keyName = key as! String
            let keyValue: String = value as! String
            
            // If property exists
            if (responds(to: Selector(keyName))) {
                self.setValue(keyValue, forKey: keyName)
            }
        }
        // Or you can do it with using
        // self.setValuesForKeysWithDictionary(JSONDictionary)
        // instead of loop method above
    }
}

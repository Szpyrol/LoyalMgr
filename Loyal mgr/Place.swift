//
//  Place.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import CoreLocation
class Place: NSObject {

    var name: String?
    var descriptionOfPlace: String?
    var imageUrl: String?
    var latitude: String?
    var longitude: String?
    
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
    
    func getLongitude()-> CLLocationDegrees
    {
        
        return CLLocationDegrees(exactly: Double(longitude!)!)!
    }
    func getLatitude()-> CLLocationDegrees
    {
        
        return CLLocationDegrees(exactly: Double(latitude!)!)!
    }
    
}

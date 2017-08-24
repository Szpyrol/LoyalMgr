//
//  Order.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
class Order : NSObject{
    
    var id: Int?
    var status: Int?
    var timeStampOfService: Double?
    var discountId: Int?
    var place: Place?
    var service: Service?
    
    
    init(dic: Dictionary<String, Any>){
        
        self.id = dic["id"] as? Int
        self.status = dic["status"] as? Int
        self.timeStampOfService = dic["timeStampOfService"] as? Double
        self.discountId = dic["discountId"] as? Int
        self.place = Place(dic: dic["place"] as! NSDictionary)
        self.service = Service(dic: dic["service"] as! NSDictionary)
        
        
    }
    
    
    
}

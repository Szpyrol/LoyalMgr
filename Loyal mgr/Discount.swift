//
//  Dicounts.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
class Discount : NSObject{
    
    var id: Int
    var name : String
    var percentage : Int//amount
    var userId: Int
    var cost: Int

    init(dic: NSDictionary){
       // super.init()
        self.id = dic.object(forKey: "id") as! Int
        self.name = dic.object(forKey: "name") as! String
        self.percentage = dic.object(forKey: "percentage") as! Int
        self.userId = dic.object(forKey: "userId") as! Int
        self.cost = dic.object(forKey: "cost") as! Int
        
    }
    
    init(dicType: NSDictionary, userId: Int){
        // super.init()
        self.id = dicType.object(forKey: "id") as! Int
        self.name = dicType.object(forKey: "name") as! String
        self.percentage = dicType.object(forKey: "percentage") as! Int
        self.cost = dicType.object(forKey: "cost") as! Int
        self.userId = userId
        
    }
    
    init( name: String, percentage: Int, userId: Int, cost: Int){
        
        self.id = -1
        self.name = name
        self.percentage = percentage
        self.userId = userId
        self.cost = cost
        
    }

    
}

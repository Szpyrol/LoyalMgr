//
//  User.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 11/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
class User : NSObject{
    
    var id: Int!
    var firstName: String!
    var email: String!
    var lastName: String!
    var phone: String!
    var password: String!
    var points: Int!
    
    
    init(dic: NSDictionary) {
        super.init()
        
        
        for (key, value) in dic {
            let keyName = key as! String
            if(keyName == "id"){
                let keyValue: Int = value as! Int
                self.id = keyValue
            }else if(keyName == "points"){
                let keyValue: Int = value as! Int
                self.points = keyValue
            
            }else{
                let keyValue: String = value as! String
                // If property exists
                if (responds(to: Selector(keyName))) {
                    self.setValue(keyValue, forKey: keyName)
                }
            }
        }
        

    
    
    
    }
    
    init(
        id: Int?,
        firstName: String?,
        lastName: String?,
        email: String?,
        phone: String?,
        points: Int?
        ) {
        super.init()
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.points = points
        
        
    }
    
    init(
        password:String!,
        firstName: String!,
        lastName: String!,
        email: String!,
        phone: String!
        ) {
        super.init()
        
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        
        
    }
    
    
}

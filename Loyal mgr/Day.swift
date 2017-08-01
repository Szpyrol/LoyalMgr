//
//  Day.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 26/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class Day: NSObject{
    
    var name: String?
    var workingDay:Bool?
    var opens:String?
    var closes:String?
    
    
    init(dic: NSDictionary) {
        super.init()
        
        
        for (key, value) in dic {
            let keyName = key as! String
           /* if(keyName == "workingDay")
            {
                 let keyValue: NSString = value as! NSString
                self.setValue(Bool(keyValue as String), forKey: keyName)
                continue
            }*/
            if(keyName == "workingDay")
            {
                let workingDayValue = value as! Bool
                self.workingDay = workingDayValue
                
            }else
            {
                let keyValue = value as? String
            
                if (responds(to: Selector(keyName))) {
                    self.setValue(keyValue, forKey: keyName)
                }
            }
            
        }

        }
}

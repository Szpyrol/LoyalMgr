//
//  DiscountCellViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class DiscountCellViewModel {
    
    var discount: Discount?
    
    init(discount :Discount){
        
        self.discount = discount
    }
    
 
    
    func getPercentage() -> String {
        
        return "\((discount?.percentage)!)"
        
    }
    
    func getName() -> String {
        
        return "\((discount?.name)!)"
        
    }
       
    
}

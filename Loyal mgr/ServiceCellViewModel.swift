//
//  ServiceCellViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class ServiceCellViewModel{
    
    var service: Service
    init( service: Service) {
        self.service = service
    }
    
    func getUrl()-> NSURL!{
        return NSURL(string: service.imageUrl!)!
    }
    
    func getName()-> String{
            return service.name!
    }

    
}

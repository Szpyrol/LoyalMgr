//
//  ServiceDetailsViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class ServiceDetailsViewModel{
    
    var service:Service?
    init(initService: Service) {
        self.service = initService
        
    }

    var titleText : String!{
        return self.service?.name
    }
    
    var imageUrl: URL{
        return URL(string: (service?.imageUrl)!)!
    }
    
    var serviceDescription: String!{
        return self.service?.serviceDescription
    }
    
}

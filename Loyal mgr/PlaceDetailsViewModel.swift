//
//  PlaceDetailsViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
class PlaceDetailsViewModel {
    
    var place:Place?
    init(initPlace: Place) {
        self.place = initPlace
        
    }
    
    var titleText: String!{
        if(place != nil){
            return place!.name
        }else{
            return ""
        }
    }
    
    var descriptionText: String?{
        return place?.descriptionOfPlace
    }
    
    var imageUrl: String!{
        print("url: " + (place?.imageUrl)!)
        return place?.imageUrl!
        
    }
    
}

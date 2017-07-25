//
//  PlaceCellModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 17/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import CoreLocation
protocol PlaceCellModelDelegate: class {
    func didGetUserLocation()
}


class PlaceCellModel{
    var place: Place
    var userLocation: CLLocation?
    weak var delegate: PlaceCellModelDelegate?
    
    
    init(place: Place ) {
        self.place = place
    }
    func getUrl()-> NSURL!{
        return NSURL(string: self.place.imageUrl!)!
    }
    
    func getName()-> String{
            if self.place.name != nil{
                return self.place.name!
            }else{
                return ""
        }
    }
    
    func setUserLocation(userLocation: CLLocation)
    {
        self.userLocation = userLocation
        self.delegate?.didGetUserLocation()
    }
    
    func getDistance()-> String{
        
        let locA = CLLocation(latitude: self.place.getLatitude(), longitude: self.place.getLongitude())
        if userLocation != nil{
            let distance = locA.distance(from: self.userLocation!)
            return String(format: "%.0f metrów",distance)
        }else{
            return "Calculating..."
        }
        
    }
    
    
    
}

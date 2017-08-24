//
//  Establishment.swift
//  Raisin
//
//  Created by Łukasz Szpyrka on 07/11/2016.
//  Copyright © 2016 Raisin SAS. All rights reserved.
//

import UIKit
import MapKit


class Establishment: MKPointAnnotation{
   

    let locationName: String

    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
          self.locationName = locationName
        
          super.init()
        self.title = title
      
        self.coordinate = coordinate
      
    }
    
  
    

}

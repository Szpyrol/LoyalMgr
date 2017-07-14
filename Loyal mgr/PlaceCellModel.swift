//
//  PlaceCellModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 17/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class PlaceCellModel{
    var place: Place
    init(place: Place) {
        self.place = place
    }
    func getName()-> String{
        return self.place.name as! String
    }
}

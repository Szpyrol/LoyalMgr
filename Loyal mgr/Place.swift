//
//  Place.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import CoreLocation
class Place: NSObject {

    var id: Int?
    var name: String?
    var descriptionOfPlace: String?
    var imageUrl: String?
    var latitude: String?
    var longitude: String?
    var adress: String?
    var available:[Day]? = [Day]()
    
    
    init(dic: NSDictionary) {
        super.init()
     
    
        for (key, value) in dic {
            let keyName = key as! String
            
            if(keyName == "available"){
                let days: NSArray = value as! NSArray
                setDays(array: days)
             
            }else if(keyName == "id"){
            //    let placeId: Int = value as! Int
            //    self.setValue(placeId, forKey: keyName)
                let keyValue: Int = value as! Int
                 self.id = keyValue
            }else{
            let keyValue: String = value as! String
            
            // If property exists
            if (responds(to: Selector(keyName))) {
            self.setValue(keyValue, forKey: keyName)
            }
                }
        }

    }
    
    func setDays(array: NSArray){
        for value in array {
            //let keyName = obj as! NS
            let day: NSDictionary = value as! NSDictionary
            let newDay: Day = Day(dic: day)
            available?.append(newDay)
            //print(keyName)
            
        }
        
        
        
    }
    
    
    func getLongitude()-> CLLocationDegrees
    {
        
        return CLLocationDegrees(exactly: Double(longitude!)!)!
    }
    func getLatitude()-> CLLocationDegrees
    {
        
        return CLLocationDegrees(exactly: Double(latitude!)!)!
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    /*func mapAnnotation()-> Establishment {
        let name = self.name ?? ""
        let streetAddress = self.streetAddress ?? ""
        let commentNumber = self.commentNumber ?? 0
        let likesNumber = self.likeVoteNumber ?? 0
        let coordinate = CLLocationCoordinate2D(latitude: self.latitude ?? 0.0 , longitude: self.longitude ?? 0.0 )
        
        let establishment = Establishment(title: name, locationName: streetAddress, type: self.establishmentType(), likesNum: likesNumber, commentsNum: commentNumber, coordinate: coordinate)
        return establishment
    }*/
}

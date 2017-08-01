//
//  UserLocManager.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import CoreLocation


class UserLocManager : NSObject{
    var manager: CLLocationManager
    var locationManagerClosures: [((_ userLocation: CLLocation) -> ())] = []

    
    override init() {
        
        self.manager = CLLocationManager()
        super.init()
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.manager.activityType = .automotiveNavigation
        self.manager.distanceFilter = 10.0  // Movement threshold for new events
     
        
    }
    
    //This is the main method for getting the users location and will pass back the usersLocation when it is available
    func getlocationForUser(userLocationClosure: @escaping ((_ userLocation: CLLocation) -> ())) {
        
        self.locationManagerClosures.append(userLocationClosure)
        
        //First need to check if the apple device has location services availabel. (i.e. Some iTouch's don't have this enabled)
        if CLLocationManager.locationServicesEnabled() {
            //Then check whether the user has granted you permission to get his location
            if CLLocationManager.authorizationStatus() == .notDetermined {
                //Request permission
                //Note: you can also ask for .requestWhenInUseAuthorization
                manager.requestWhenInUseAuthorization()
            } else if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied {
                //... Sorry for you. You can huff and puff but you are not getting any location
            } else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                // This will trigger the locationManager:didUpdateLocation delegate method to get called when the next available location of the user is available
                manager.startUpdatingLocation()
            }
        }
        
    }
    
    //MARK: CLLocationManager Delegate methods
    
    @nonobjc func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
        //Then check whether the user has granted you permission to get his location
        if CLLocationManager.authorizationStatus() == .notDetermined {
            //Request permission
            //Note: you can also ask for .requestWhenInUseAuthorization
            manager.requestWhenInUseAuthorization()
            
    }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        //Because multiple methods might have called getlocationForUser: method there might me multiple methods that need the users location.
        //These userLocation closures will have been stored in the locationManagerClosures array so now that we have the users location we can pass the users location into all of them and then reset the array.

    }
}

extension UserLocManager: CLLocationManagerDelegate{
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

       let tempClosures = self.locationManagerClosures
        for closure in tempClosures {
            closure(locations[0])
        }
        self.locationManagerClosures = []
 
        
    }
}

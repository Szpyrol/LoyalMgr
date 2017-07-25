//
//  PlacesListViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import CoreLocation
protocol PlacesListViewModelDelegate :class {
    func didSetPlaces()
    func didChoosePlace(place: Place)
}
class PlacesListViewModel {
    
    var places:[Place] = [Place]()
    weak var delegate: PlacesListViewModelDelegate?
    var lastUserLocation : CLLocation?
    var locationManager: UserLocManager?
    var placeCellModels: [PlaceCellModel] = [PlaceCellModel]()
    
    init(listView: PlacesListViewModelDelegate) {
        self.delegate = listView
        
        self.locationManager = UserLocManager()
        self.locationManager?.getlocationForUser { (userLocation: CLLocation) -> () in
            self.lastUserLocation = userLocation
            self.updateCellsWith(userLocation: userLocation)
        }
        
    }
    
    func getPlaceAtIndex(indexOfPlace: Int)-> Place{
        return self.places[indexOfPlace]
    }
    
    func setPlaces(fetchedPlaces: [Place])
    {
        self.places = fetchedPlaces;
        
        for singlePlace: Place in self.places {
            placeCellModels.append(PlaceCellModel(place: singlePlace))
        }
        
        self.delegate?.didSetPlaces()
    }
    func didChoosePlaceToShow(indexPath: IndexPath)
    {
        self.delegate?.didChoosePlace(place: self.getPlaceAtIndex(indexOfPlace: indexPath.row))
    }
    
    func modelAtIndex(index: IndexPath) -> PlaceCellModel{
        let cellModel:PlaceCellModel = self.placeCellModels[index.row] 
        
        return cellModel
    }
    
    func updateCellsWith(userLocation: CLLocation)
    {
        for cellModel: PlaceCellModel in self.placeCellModels {
        
            cellModel.setUserLocation(userLocation: self.lastUserLocation!)
        }
    }
    
    
}

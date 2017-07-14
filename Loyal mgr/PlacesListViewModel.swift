//
//  PlacesListViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

protocol PlacesListViewModelDelegate :class {
    func didSetPlaces()
}
class PlacesListViewModel {
    
    var places:[Place] = [Place]()
    weak var delegate: PlacesListViewModelDelegate?
    
    init(listView: PlacesListViewModelDelegate) {
        self.delegate = listView
    }
    
    func setPlaces(fetchedPlaces: [Place])
    {
        self.places = fetchedPlaces;
        self.delegate?.didSetPlaces()
    }
    func modelAtIndex(index: IndexPath) -> PlaceCellModel{
        let cellModel:PlaceCellModel = PlaceCellModel(place: places[index.row] )
        
        return cellModel
    }
    
}

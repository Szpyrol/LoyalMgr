//
//  PlaceDetailsFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit
class PlaceDetailsFlowCoordinator: FlowCoordinator {
    
    let configure : FlowConfigure!
    var childFlow : FlowCoordinator?
    var place: Place? // Place for the flow

    required init(configure: FlowConfigure) {
        self.configure = configure
    }

    func setPlace(placeToSet: Place){
        self.place = placeToSet
    }
    
    func start() {
        
        let storyboard = UIStoryboard(name: "PlaceDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"PlaceDetailsViewController") as! PlaceDetailsViewController
        
        if(self.place != nil ){
            viewController.viewModel = PlaceDetailsViewModel(initPlace: self.place!)
            
        }
        viewController.delegate = self
        configure.navigationController?.pushViewController(viewController, animated: true)
      
    }
    
    func startPlaceServices(){
        
        let storyboard = UIStoryboard(name: "PlaceDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"PlaceServicesTableViewController") as! PlaceServicesTableViewController
        viewController.viewModel = PlaceServicesViewModel(viewController: viewController)
        viewController.viewModel?.fetchItems()
        //viewController.viewModel?.delegate = viewController
        
        configure.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
    func startServiceController(service: Service){
        
    }
    
}
extension PlaceDetailsFlowCoordinator: PlaceDetailsViewControllerDelegate{
    func didChooseToCheckServices() {
        startPlaceServices()
    }
}
extension PlaceDetailsFlowCoordinator: PlaceServicesTableViewControllerDelegate{
    func didChooseService(service: Service) {
        self.startServiceController(service: Service)
        
       
        
    }
}


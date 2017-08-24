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
    //    self.childFlow?.configure = self
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
    
    func startPlaceServices(place: Place){
        
        let storyboard = UIStoryboard(name: "PlaceDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"PlaceServicesTableViewController") as! PlaceServicesTableViewController
        viewController.viewModel = PlaceServicesViewModel(viewController: viewController, place: place )
        viewController.viewModel?.fetchItems()
        viewController.delegate = self
        
        configure.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
    func startServiceController(service: Service){
        
        let storyboard = UIStoryboard(name: "PlaceDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"ServiceDetailsViewController") as! ServiceDetailsViewController
        viewController.viewModel = ServiceDetailsViewModel(initService: service)
        viewController.delegate = self
        configure.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func startOrder(service: Service){
        
        let storyboard = UIStoryboard(name: "PlaceDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"ServiceOrderViewController") as! ServiceOrderViewController
        viewController.viewModel = ServiceOrderViewModel(vc: viewController,service: service, place: self.place!)
        viewController.delegate = self
        //viewController.viewModel?.fetchItems()
        
        configure.navigationController?.pushViewController(viewController, animated: true)
        print("start order")
        
    }
    
    func didFinishFlow(){
        
        self.configure.navigationController?.popToRootViewController(animated: true)
        
        
    }
}
extension PlaceDetailsFlowCoordinator: PlaceDetailsViewControllerDelegate{
    func didChooseToCheckServices(place: Place) {
        startPlaceServices(place: place)
    }
}
extension PlaceDetailsFlowCoordinator: PlaceServicesTableViewControllerDelegate{
    func didChooseService(service: Service) {
        self.startServiceController(service: service)
    }
}
extension PlaceDetailsFlowCoordinator: ServiceDetailsViewControllerDelegate{
    func wishToOrder(service: Service) {
        startOrder(service: service)
        
    }
}
extension PlaceDetailsFlowCoordinator: ServiceOrderViewControllerDelegate{
    func didPressSendRequest() {
        
        didFinishFlow()
        
    }
}


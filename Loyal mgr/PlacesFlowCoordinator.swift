//
//  PlacesFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit
import SideMenu
class PlacesFlowCoordinator: FlowCoordinator {
    let configure : FlowConfigure!
    var childFlow : FlowCoordinator?
    var menuLeftNavigationController: UISideMenuNavigationController!
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func setMenuNavigationController(menuNavController: UISideMenuNavigationController){
        self.menuLeftNavigationController = menuNavController
    }
    
    func start() {

       
        startPlaces()
     
    }
    func startPlaces(){
        
        let storyboard = UIStoryboard(name: "Places", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"PlacesViewController") as! PlacesViewController
        
        //MARK: List
        viewController.listVC = storyboard.instantiateViewController(withIdentifier: "PlacesListTableViewController") as? PlacesListTableViewController
        viewController.listVC?.viewModel = PlacesListViewModel(listView: viewController.listVC!)
        
        //MARK: Map
        viewController.mapVC = storyboard.instantiateViewController(withIdentifier: "PlacesMapViewController") as? PlacesMapViewController
        viewController.mapVC?.viewModel = PlacesMapViewModel()
        
        viewController.viewModel = PlacesViewModel(viewController: viewController)
        viewController.viewModel?.fetchItems()
        viewController.delegate = self
        

        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        /*SideMenuManager.menuAddPanGestureToPresent(toView: configure.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: configure.navigationController!.view)*/
        SideMenuManager.menuFadeStatusBar = false
        
        configure.navigationController?.pushViewController(viewController, animated: false)
        
    }
    func startDetailedPlaceFlow(place: Place){
        
        let detailedPlaceConf = FlowConfigure(window: nil, navigationController: configure.navigationController, parent: self)
        let detailedPlaceCoordinator = PlaceDetailsFlowCoordinator(configure: detailedPlaceConf)
        detailedPlaceCoordinator.setPlace(placeToSet: place)
        detailedPlaceCoordinator.start()
        childFlow = detailedPlaceCoordinator
        
    }
    
    
}

extension PlacesFlowCoordinator : PlacesViewControllerDelegate{
    func PlacesViewControllerDidFinish() {
        
    }
    func PlaceViewDidSelectDetailedPlace(place: Place) {
        startDetailedPlaceFlow(place: place)
        
    }
}


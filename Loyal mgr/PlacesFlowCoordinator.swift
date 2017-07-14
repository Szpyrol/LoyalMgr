//
//  PlacesFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

class PlacesFlowCoordinator: FlowCoordinator {
    let configure : FlowConfigure!
    var childFlow : FlowCoordinator?
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
   // #error tak jak na mapie z cellkami
    
    func start() {

        let storyboard = UIStoryboard(name: "Places", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"PlacesViewController") as! PlacesViewController
        
        
       // viewController.viewModel?.delegate = viewController
       // viewController.viewModel?.fetchItems()
        
        
        
        //MARK: List
        viewController.listVC = storyboard.instantiateViewController(withIdentifier: "PlacesListTableViewController") as? PlacesListTableViewController
        viewController.listVC?.viewModel = PlacesListViewModel(listView: viewController.listVC!)
        
        //MARK: Map
        viewController.mapVC = storyboard.instantiateViewController(withIdentifier: "PlacesMapViewController") as? PlacesMapViewController
        viewController.mapVC?.viewModel = PlacesMapViewModel()
        
        viewController.viewModel = PlacesViewModel(viewController: viewController)
        viewController.viewModel?.fetchItems()
        viewController.delegate = self
        configure.navigationController?.pushViewController(viewController, animated: false)

    }
    

}

extension PlacesFlowCoordinator : PlacesViewControllerDelegate{
    func PlacesViewControllerDidFinish() {
        
    }
}



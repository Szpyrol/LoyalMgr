//
//  MainFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

class MainFlowCoordinator: FlowCoordinator {
    
    let configure : FlowConfigure!
    
    var placesFlowCoordinator : PlacesFlowCoordinator?
    
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
       /* if Auth.sharedInstance.isLoggedIn() {
            showMainFlow()
        } else {
            showAuthFlow()
        }*/
        
        showMainFlow()
    }
    
  
   
    func showMainFlow() {
        
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = false;
        
        if let frame = configure.window?.bounds {
            navigationController.view.frame = frame
        }
        
        configure.window?.rootViewController = navigationController
        configure.window?.makeKeyAndVisible()
        
        let placesConfigure = FlowConfigure(window: nil, navigationController: navigationController, parent: self)
        placesFlowCoordinator = PlacesFlowCoordinator(configure: placesConfigure)
        placesFlowCoordinator?.start()
        
    }
}



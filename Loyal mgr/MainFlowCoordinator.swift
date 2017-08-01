//
//  MainFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class MainFlowCoordinator: FlowCoordinator {
    
    let configure : FlowConfigure!
    
    var childFlow : FlowCoordinator?
    var menuLeftNavigationController: UISideMenuNavigationController!
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
       /* if Auth.sharedInstance.isLoggedIn() {
            showMainFlow()
        } else {
            showAuthFlow()
        }*/
        
        
       
        
        self.preparationForFlow(starting:
            self.startPlaces(navController:))
    }
    
    func preparationForFlow( starting: ( _ nav: UINavigationController)-> Void){
        
        let menuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier :"MenuViewController") as! MenuViewController
        
        menuLeftNavigationController = UISideMenuNavigationController(rootViewController: menuVC)
        menuLeftNavigationController.leftSide = true
        menuVC.delegate = self

        
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = false;
        
        if let frame = configure.window?.bounds {
            navigationController.view.frame = frame
        }
        
        configure.window?.rootViewController = navigationController
        configure.window?.makeKeyAndVisible()
        
        starting(navigationController)
        
    }
    

   
    func startPlaces(navController: UINavigationController) {

        
        
        let placesConfigure = FlowConfigure(window: nil, navigationController: navController, parent: self)
        let placesFlowCoordinator = PlacesFlowCoordinator(configure: placesConfigure)
        placesFlowCoordinator.setMenuNavigationController(menuNavController: menuLeftNavigationController)
        placesFlowCoordinator.start()
      
    }
    
    
    
    

    func startSettings(navController: UINavigationController){
        
        
        let settingsConf = FlowConfigure(window: nil, navigationController: navController, parent: self)
        let settingsCoordinator = SettingsFlowCoordinator(configure: settingsConf)
        
        settingsCoordinator.start()
        childFlow = settingsCoordinator
        
    }
    
    func startDiscounts(navController: UINavigationController){
        
      
        
        
        
        let discountsConf = FlowConfigure(window: nil, navigationController: navController, parent: self)
        let discountsCoordinator = DiscountsFlowCoordinator(configure: discountsConf)
        
        discountsCoordinator.start()
        childFlow = discountsCoordinator
        
    }
    func startOrders(navController: UINavigationController){
        
        let ordersConf = FlowConfigure(window: nil, navigationController: navController, parent: self)
        let ordersCoordinator = OrdersFlowCoordinator(configure: ordersConf)
        
        ordersCoordinator.start()
        childFlow = ordersCoordinator
        //configure = ordersCoordinator
    }
    

    
    
}
extension MainFlowCoordinator: MenuViewControllerDelegate{
    func didChooseFromMenu(index: Int) {
        menuLeftNavigationController.dismiss(animated: true, completion: {
        switch index {
        case 1://lokale
          //  self.startPlaces()
            self.preparationForFlow(starting:
                self.startPlaces(navController:))
            break;
        case 2://moje zamowienia
            self.preparationForFlow(starting:
                self.startOrders(navController:))
            break;
        case 3://rabaty
             self.preparationForFlow(starting: self.startDiscounts(navController:))
            break;
        case 4://ustawienia
            self.preparationForFlow(starting:
                self.startSettings(navController:))
            break;
            
        default:
            break;
        }
        
        })
        
    }
}



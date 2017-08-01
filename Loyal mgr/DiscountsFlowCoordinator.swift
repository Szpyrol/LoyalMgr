//
//  DiscountsFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class DiscountsFlowCoordinator: FlowCoordinator {
    let configure : FlowConfigure!
    var childFlow : FlowCoordinator?
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        
        
        let storyboard = UIStoryboard(name: "Discounts", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"DiscountsViewController") as! DiscountsViewController
        
        
        
        configure.navigationController?.pushViewController(viewController, animated: false)
        viewController.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
}

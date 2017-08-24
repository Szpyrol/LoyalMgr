//
//  SettingsFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import SideMenu

class SettingsFlowCoordinator: FlowCoordinator {
    let configure : FlowConfigure!
    var childFlow : FlowCoordinator?
    
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        
        
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"SettingsViewController") as! SettingsViewController
        viewController.viewModel = SettingsViewModel(viewController: viewController)
        viewController.delegate = self
        
        
        
        configure.navigationController?.pushViewController(viewController, animated: false)
        viewController.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
}


extension SettingsFlowCoordinator: SettingsViewControllerDelegate{
    
}


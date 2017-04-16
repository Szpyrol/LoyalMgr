//
//  SplashFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

class SplashFlowCoordinator: FlowCoordinator {
    var configure:FlowConfigure!
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"SplashViewController") as! SplashViewController

        if let frame = configure.window?.bounds {
            viewController.view.frame = frame
        }
        viewController.delegate = self
        configure.window?.rootViewController = viewController
        configure.window?.makeKeyAndVisible()
    }
    
}

extension SplashFlowCoordinator:SplashViewControllerDelegate {
    func splashViewControllerDidFinished() {
        let mainFlow = MainFlowCoordinator(configure: configure)
        mainFlow.start()
    }
}

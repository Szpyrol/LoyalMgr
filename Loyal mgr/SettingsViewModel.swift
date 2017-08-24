//
//  SettingsViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
protocol SettingsViewModelDelegate: class{
    func didSendData()
}
class SettingsViewModel: NSObject {
    
    weak var delegate: SettingsViewModelDelegate?
    
    
    init(viewController: SettingsViewModelDelegate) {
        self.delegate = viewController
    }
    
    func getfirstName() -> String{
        return (Auth.sharedInstance.user?.firstName)!
    }
    
    func getlastName() -> String{
        return (Auth.sharedInstance.user?.lastName)!
    }
    func getphone() -> String{
        return (Auth.sharedInstance.user?.phone)!
    }
    
    
    
    
    
    
}

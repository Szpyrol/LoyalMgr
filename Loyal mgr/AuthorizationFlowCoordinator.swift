//
//  AuthorizationFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import  UIKit

protocol AuthorizationFlowCoordinatorDelegate: class{
    func didFinishWithUserData()
}
class AuthorizationFlowCoordinator: FlowCoordinator {
    let configure : FlowConfigure!
    var childFlow : FlowCoordinator?
    weak var delegate: AuthorizationFlowCoordinatorDelegate?
    
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        
        
        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"AuthorizationViewController") as! AuthorizationViewController
        viewController.delegate = self
        

        configure.navigationController?.pushViewController(viewController, animated: false)

    }
    
    func startLogin(){
     
        configure.navigationController?.isNavigationBarHidden = false
        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"LoginViewController") as! LoginViewController
        viewController.delegate = self
        viewController.viewModel = LoginViewModel(controller: viewController)
        configure.navigationController?.pushViewController(viewController, animated: false)
        

        
    }
    
    func startRegister(){
        
        configure.navigationController?.isNavigationBarHidden = false
        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"RegisterViewController") as! RegisterViewController
        viewController.delegate = self
        viewController.viewModel = RegisterViewModel(viewController: viewController)
        configure.navigationController?.pushViewController(viewController, animated: false)
        

        
    }
    
    
    
    
}


extension AuthorizationFlowCoordinator: AuthorizationViewControllerDelegate{
    func didPressLogin() {
        self.startLogin()
    }
    func didPressRegister() {
        self.startRegister()
    }
    
}
extension AuthorizationFlowCoordinator: LoginViewControllerDelegate{
    
    func didFinishSigning() {
     self.delegate?.didFinishWithUserData()
        
    }
    
}
extension AuthorizationFlowCoordinator: RegisterViewControllerDelegate{
    
    func didFinishRegister() {
        self.delegate?.didFinishWithUserData()
    }
    
}


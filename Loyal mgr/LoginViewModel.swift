//
//  LoginViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
protocol LoginViewModelDelegate: class {
    
    func didSignIn()
    func didNotSignInWithError(errorTxt: String)
    
}
class LoginViewModel{
    
    var delegate: LoginViewModelDelegate?
    
    init(controller: LoginViewModelDelegate) {
        self.delegate = controller
    }
    
    func signIn(emailCell: FormTableViewCell, passwordCell: FormTableViewCell){
        
        API.sharedInstance.getUserData(email: emailCell.textField.text!, password: passwordCell.textField.text!, completion:{(status, error) in
            
            print(error.debugDescription)
            if(error == nil){
                self.delegate?.didSignIn()
            }else{
                self.delegate?.didNotSignInWithError(errorTxt: error!)
            }
            
        })
    }
}

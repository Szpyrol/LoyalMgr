//
//  RegisterViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
protocol RegisterViewModelDelegate: class {
    func didSignUp()
    func didNotSignUPWithError(errorTxt: String)
}
class RegisterViewModel{
    
    weak var delegate: RegisterViewModelDelegate?
    init(viewController: RegisterViewModelDelegate) {
        
        self.delegate = viewController
    }
    
    
    func signUpWith(
            firstCell: FormTableViewCell,
            surnameCell: FormTableViewCell,
            passwordCell: FormTableViewCell,
            passwordRepeatCell: FormTableViewCell,
            phoneCell: FormTableViewCell,
            emailCell: FormTableViewCell

        ){
        
        let user = User(password: passwordCell.textField.text,
                        firstName: firstCell.textField.text,
                        lastName: surnameCell.textField.text,
                        email: emailCell.textField.text,
                        phone: phoneCell.textField.text)
        
        API.sharedInstance.postUserData(user: user, completion: {(status, error) in
        
            if(error == nil){
                
                API.sharedInstance.getUserData(email: emailCell.textField.text!, password: passwordCell.textField.text!, completion:{(status, error) in
                    
                    print(error.debugDescription)
                    if(error == nil){
                        self.delegate?.didSignUp()
                    }else{
                         self.delegate?.didNotSignUPWithError(errorTxt: error!)
                    }
                    
                })

                
                
                
                
                
            }else{
                self.delegate?.didNotSignUPWithError(errorTxt: error!)
            }
        
        })
        
        
          }
    
    
}

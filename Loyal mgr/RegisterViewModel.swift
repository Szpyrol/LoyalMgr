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
        
        
        
        if(isTooshort(txt: firstCell.textField.text, len: 3)){
            self.delegate?.didNotSignUPWithError(errorTxt:"Imię zbyt krótkie")
            return;
        }
        if(isTooshort(txt: surnameCell.textField.text, len: 3)){
            self.delegate?.didNotSignUPWithError(errorTxt:"Nazwisko zbyt krótkie")
            return;
        }
        if(isTooshort(txt: phoneCell.textField.text, len: 9)){
            self.delegate?.didNotSignUPWithError(errorTxt:"Numer telefonu zbyt krótki")
            return;
        }
        
        if(isTooshort(txt: passwordCell.textField.text, len: 6)){
            self.delegate?.didNotSignUPWithError(errorTxt:"Hasło zbyt krótkie")
            return;
        }
      
        
        if(isValidEmail(testStr: emailCell.textField.text!)){
            self.delegate?.didNotSignUPWithError(errorTxt: "Zły format email")
            return;
        }
        
        if(passwordCell.textField.text == passwordRepeatCell.textField.text){
            self.delegate?.didNotSignUPWithError(errorTxt: "Powtórzone hasło musi być takie samo")
            return;
        }
       
        
        
        
        
        
        
        
        
        
        
        
        
        
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
    
    
    func isTooshort(txt: String?, len: Int) -> Bool!{
        if(txt != nil)
        {
            if((txt?.characters.count)! < len){
                return true
            }else{
                return false
            }
        }
        return true
    }
    
    
    func encodePassword(plain: String) -> String{
        
        let data = (plain).data(using: String.Encoding.utf8)
        let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64
        
        
    }
    
    
    
    
    
    
    
    
    
    
    

    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
}

//
//  SettingsViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
protocol SettingsViewModelDelegate: class{
    func didSendData(params: Dictionary<String, String>)
    func showMgs(txt: String)
}
class SettingsViewModel: NSObject {
    
    weak var delegate: SettingsViewModelDelegate?
    
    var initialFirstName: String?
    var initialLastName: String?
    var initialPhone: String?
    
    
    
    
    
    init(viewController: SettingsViewModelDelegate) {
        self.delegate = viewController
    }
    
    func getfirstName() -> String{
        initialFirstName = (Auth.sharedInstance.user?.firstName)!
        return initialFirstName!
    }
    
    func getlastName() -> String{
        initialLastName = (Auth.sharedInstance.user?.lastName)!
        return initialLastName!
    }
    func getphone() -> String{
        initialPhone = (Auth.sharedInstance.user?.phone)!
        return initialPhone!
    }
    
    
    func validateForms(firstName: String?,
                       lastName: String?,
                       phone:String?,
                       password1: String?,
                       password2:String?){
        
        if(isTooshort(txt: firstName, len: 3)){
            self.delegate?.showMgs(txt: "Imię zbyt krótkie")
            return;
        }
        if(isTooshort(txt: lastName, len: 3)){
            self.delegate?.showMgs(txt: "Nazwisko zbyt krótkie")
            return;
        }
        if(isTooshort(txt: phone, len: 9)){
            self.delegate?.showMgs(txt: "Numer telefonu zbyt krótki")
            return;
        }
        
        var dictionary =  [String:String]()
        
        
        //password ==
        print((password1?.characters.count)!)
       
        if((password1?.characters.count)! > 0)
        {
            if((password1?.characters.count)! < 6){
                self.delegate?.showMgs(txt: "Hasło zbyt krótkie")
                return;
            }else{
                
                if(password1 == password2){
                    dictionary.updateValue(encodePassword(plain: password1!), forKey: "password")
                }else{
                    self.delegate?.showMgs(txt: "Powtórzone hasło musi być takie samo")
                    return;
                }
                
            }
        }
       
        
        
        if(initialFirstName != firstName){
        
            dictionary.updateValue(firstName!, forKey: "firstName")
        }
        if(initialLastName != lastName){
            
            dictionary.updateValue(lastName!, forKey: "lastName")
        }
        if(initialPhone != phone){
            
            dictionary.updateValue(phone!, forKey: "phone")
        }
        
        print(dictionary)
        self.delegate?.didSendData(params: dictionary)
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
}

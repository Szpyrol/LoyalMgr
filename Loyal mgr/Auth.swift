//
//  Auth.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 11/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

class Auth : NSObject{
    
    static var sharedInstance = Auth()
    let notificationName = Notification.Name("UserUpdate")
    
    var user: User?
    var token:String!
    
    let emailKey:String = "userEmailKey"
    let firstNameKey:String = "userFirstNameKey"
    let lastNameKey:String = "userLastNameKey"
    let phoneKey:String = "userPhoneKey"
    let idKey:String = "userIdKey"
    let pointsKey:String = "pointsKey"
    
    let tokenKey:String = "userTokenKey"
    
    override init(){
    super.init()
        retrieveUser()
        retrieveToken()
    }
    
    
    func initWithDictionary(dic: NSDictionary){
        
        self.user = User(dic: dic)
        if ((dic.object(forKey: "token")) != nil){
            self.token = (dic.object(forKey: "token") as! String)
            saveToken()
        }
        saveUser()
        
        
    }
 
    func updateUserData(completionUpdate:@escaping (_ completedUpdate:Bool) -> Void){
        
        
        API.sharedInstance.refreshUserData(completion:
            {status, error in
                
                if( status != nil){
                    self.saveUser()
                    // Post notification
                    NotificationCenter.default.post(name: self.notificationName, object: nil)
                    completionUpdate(true)
                    
                    
                }
        
        }
        )
    }
    
    func retrieveUser(){
        
        
        
        let defaults = UserDefaults.standard
        let user = User(id: defaults.integer(forKey: idKey),
                        firstName: defaults.object(forKey: firstNameKey) as? String,
                        lastName: defaults.object(forKey: lastNameKey) as? String,
                        email: defaults.object(forKey: emailKey) as? String,
                        phone: defaults.object(forKey: phoneKey) as? String,
                        points: defaults.object(forKey: pointsKey) as? Int)
        self.user = user
        
        
        
    }
    func retrieveToken(){
        
        
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: tokenKey) as? String
        if(token != nil){
            self.token = token
        }
    }
    
    
    func saveUser(){

        let defaults = UserDefaults.standard
        defaults.set(self.user?.email, forKey: emailKey)
        defaults.set(self.user?.firstName, forKey: firstNameKey)
        defaults.set(self.user?.lastName, forKey: lastNameKey)
        defaults.set(self.user?.phone, forKey: phoneKey)
        defaults.set(self.user?.id, forKey: idKey)
        defaults.set(self.user?.points, forKey: pointsKey)
        defaults.synchronize()
        
    }
    
    func saveToken(){
        let defaults = UserDefaults.standard
        defaults.set(self.token, forKey: tokenKey)
        defaults.synchronize()
        
        
    }
    func logoutUser(){
       
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: tokenKey)
        self.token = nil
        defaults.synchronize()
        
    }
    func isLoggedIn() -> Bool{
        
        retrieveToken()
        if(self.token != nil){
            return true
        }else{
            return false
        }
        
    }
}

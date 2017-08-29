//
//  API.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 29/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import Alamofire

import UIKit
class API {
    let baseURL:String = "http://192.168.0.206:8080/"//"http://10.20.0.52:8080/" //10.81.100.76
    
    static let sharedInstance = API()
    
    
    func headers() -> [String:String]? {
      /*  if let token = Auth.sharedInstance.getToken() {
            return ["Authorization" : "Token " + token]
        }*/
        return nil;
    }
}

extension API{
  
       func getPlaces(completion:@escaping (_ places:NSArray?, _ error: NSError?) -> Void){
        let parameters: Parameters = ["foo": "bar"]
        let token = Auth.sharedInstance.token
        let headers: HTTPHeaders = ["Authorization": "Bearer "+token!]
        
        Alamofire.request(baseURL+"places", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                let array: NSArray = response.result.value as! NSArray
                completion( array, nil)
                break
                
            case .failure(_):
                break
                
                }
            }
        
        
        }
    
    
    
    
    func getServices(placeId: Int, completion:@escaping (_ services:NSArray?, _ error: NSError?) -> Void){
        let parameters: Parameters = ["foo": "bar"]
        let token = Auth.sharedInstance.token
        let headers: HTTPHeaders = ["Authorization": "Bearer "+token!]
        Alamofire.request(baseURL+"servicesForPlace/\(placeId)", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                let array: NSArray = response.result.value as! NSArray
                
                completion( array, nil)
                
                // }
                break
                
            case .failure(_):
                break
                
            }
        }
        
        
    }

    
    func updateUserData(params: Dictionary<String, String>,completion:@escaping (_ userData:String?, _ error: String?) -> Void){
        
        
        
        let token = Auth.sharedInstance.token
        let headers: HTTPHeaders = ["Authorization": "Bearer "+token!]
        
        let userId: String = String((Auth.sharedInstance.user!.id!))
        let url :String = "\(baseURL)userRes/\(userId))"
        
        Alamofire.request(url, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            let statusCode = response.response?.statusCode
            switch(response.result) {
            case .success(_):
                
                print(String(describing: response.result.value))
                if(statusCode == 200){
                   // Auth.sharedInstance.initWithDictionary(dic: response.result.value as! NSDictionary)
                    completion( "did it", nil)
                }else{
                    
                    completion( nil, String(describing:statusCode))
                }
                // }
                break
                
            case .failure(_):
                completion( nil, String(describing:statusCode))
                break
                
            }
        }
        
        
    }
    
    
    
    

    func postUserData( user:User,completion:@escaping (_ status: String?, _ error: String?) -> Void){
        
        let parameters: Parameters = ["firstName": user.firstName,
                                      "lastName": user.lastName,
                                      "email": user.email,
                                      "phoneKey": user.phone,
                                      "password": user.password
            
                                      ]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        Alamofire.request(baseURL+"userRes", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            let statusCode = response.response?.statusCode
            
            switch(response.result) {
            case .success(_):
                
                
                if(statusCode == 200){
                
                    let val:NSDictionary = response.result.value as! NSDictionary
                    let confirmation: String = val.object(forKey: "status") as! String
                    //Auth.sharedInstance.initWithDictionary(dic: response.result.value as! NSDictionary)
                    print(confirmation)
                    if(confirmation == "ok"){
                        completion( "did it", nil)
                    }
                }else{
                    
                    completion( nil, String(describing:statusCode))
                }
              
                
              
                break
                
            case .failure(_):
                completion( nil, String(describing:statusCode))

                break
                
            }
        }
        
        
    }

    func refreshUserData(completion:@escaping (_ userData:String?, _ error: String?) -> Void){
        
        
    
            let token = Auth.sharedInstance.token
           let headers: HTTPHeaders = ["Authorization": "Bearer "+token!]
        
        
            Alamofire.request(baseURL+"whoAmI", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
                let statusCode = response.response?.statusCode
                switch(response.result) {
                case .success(_):
                    
                    print(String(describing: response.result.value))
                    if(statusCode == 200){
                        Auth.sharedInstance.initWithDictionary(dic: response.result.value as! NSDictionary)
                        completion( "did it", nil)
                    }else{
                        
                        completion( nil, String(describing:statusCode))
                    }
                    // }
                    break
                    
                case .failure(_):
                    completion( nil, String(describing:statusCode))
                    break
                    
                }
            }
            
            
        }
    
    

    
    
    
    
    
    func getUserData(email: String, password: String,completion:@escaping (_ userData:String?, _ error: String?) -> Void){
    
        
        
        let utf8str = String(email+":"+password).data(using: String.Encoding.utf8)
        if let base64Encoded = utf8str?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        {

        let headers: HTTPHeaders = ["Authorization": "Basic "+base64Encoded]//c3pweXJvbDp6d3lyb2w=
        
        Alamofire.request(baseURL+"me", method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            let statusCode = response.response?.statusCode
            switch(response.result) {
            case .success(_):
                
                print(String(describing: response.result.value))
                if(statusCode == 200){
                Auth.sharedInstance.initWithDictionary(dic: response.result.value as! NSDictionary)
                    completion( "did it", nil)
                }else{
                    
                    completion( nil, String(describing:statusCode))
                }
                // }
                break
                
            case .failure(_):
                completion( nil, String(describing:statusCode))
                break
                
            }
        }
        
        
    }
    }
    
    
    
    
    func buyDiscountFor( user:User, discount: Discount, completion:@escaping (_ status: String?, _ error: String?) -> Void){
        
        
        let token = Auth.sharedInstance.token
        let headers: HTTPHeaders = ["Authorization": "Bearer "+token!,
                                    "Content-Type": "application/json"]
        
        let parameters: Parameters = ["name": discount.name,
                                      "percentage": discount.percentage,
                                      "userId": discount.userId,
                                     "cost": discount.cost
        ]
        
    
        
        Alamofire.request(baseURL+"discounts", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            let statusCode = response.response?.statusCode
            
            switch(response.result) {
            case .success(_):
                
                
                if(statusCode == 200){
                    
                    let val:NSDictionary = response.result.value as! NSDictionary
                    let confirmation: String = val.object(forKey: "status") as! String

                    if(confirmation == "ok"){
                        completion( "did it", nil)
                    }
                }else{
                    
                    completion( nil, String(describing:statusCode))
                }
                
                
                
                break
                
            case .failure(_):
                completion( nil, String(describing:statusCode))
                
                break
                
            }
        }
        
        
    }
    
    
    func getMyDiscounts(id: Int,completion:@escaping (_ services:NSArray?, _ error: NSError?) -> Void){
        let parameters: Parameters = ["foo": "bar"]
        let token = Auth.sharedInstance.token
        let headers: HTTPHeaders = ["Authorization": "Bearer "+token!]
        let url = baseURL+"discountsFor/"+String(id)
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                let array: NSArray = response.result.value as! NSArray
                
                completion( array, nil)
                
                // }
                break
                
            case .failure(_):
                break
                
            }
        }
        
        
    }
    func getDiscountsTypes(completion:@escaping (_ services:NSArray?, _ error: NSError?) -> Void){

        let url = baseURL+"discountTypes"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                let array: NSArray = response.result.value as! NSArray
                
                completion( array, nil)
                
                // }
                break
                
            case .failure(_):
                break
                
            }
        }
        
        
    }

    
    

    func makeOrder( userId:Int ,serviceId: Int,  discountId: Int, timestampForService: Double, completion:@escaping (_ status: String?, _ error: String?) -> Void){
        
        
        let token = Auth.sharedInstance.token
        let headers: HTTPHeaders = ["Authorization": "Bearer "+token!,
                                    "Content-Type": "application/json"]
        
        let parameters: Parameters = ["userId": userId,
                                      "serviceId": serviceId,
                                      "discountId": discountId,
                                      "timeStampOfService": timestampForService
        ]
        
        
        
        Alamofire.request(baseURL+"orders", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            let statusCode = response.response?.statusCode
            
            switch(response.result) {
            case .success(_):

                
                completion("status", nil)
                
                
                break
                
            case .failure(_):
                completion( nil, String(describing:statusCode))
                
                break
                
            }
        }
        
        
    }

    func getOrdersForUser(completion:@escaping (_ services:NSArray?, _ error: NSError?) -> Void){
        let parameters: Parameters = ["foo": "bar"]
        let token = Auth.sharedInstance.token
        let headers: HTTPHeaders = ["Authorization": "Bearer "+token!]
        let url = baseURL+"ordersForUser"
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
                let array: NSArray = response.result.value as! NSArray
                print("\(array)")
                
                completion( array, nil)
                
                // }
                break
                
            case .failure(_):
                break
                
            }
        }
        
        
    }

    
    
}

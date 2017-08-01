//
//  API.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 29/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import Alamofire


class API {
    let baseURL:String = "http://192.168.0.206:8080/"
    
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
        Alamofire.request(baseURL+"places", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                
             //   if let data = response.result.value{
                
                    let array: NSArray = response.result.value as! NSArray
                    
                    completion( array, nil)
                    
               // }
                break
                
            case .failure(_):
                break
                
            }
        }
    
        
    }
    
    func getServices(completion:@escaping (_ services:NSArray?, _ error: NSError?) -> Void){
        let parameters: Parameters = ["foo": "bar"]
        Alamofire.request(baseURL+"services", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
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
    
    
    
    
    
}

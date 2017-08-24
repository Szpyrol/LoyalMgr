//
//  OrderCellViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 13/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class OrderCellViewModel: NSObject{
 
    private var order: Order?
    
    
    init(order:Order){
        self.order = order
    }
    
    func getImageUrl() -> URL{
        return URL(string: (order?.service?.imageUrl)!)!
    }
    func getServiceTitle() -> String{
        return (order?.service?.name!)!
    }
    func getAdress() -> String {
        return "\((order?.place?.adress)!) \n \((getDateText())!)"
    }
    func getPlaceName() -> String {
        return (order?.place?.name)!
    }
    
    
    func getDateText() -> String! {
        
        let timeStamp = order?.timeStampOfService
        let date = Date(timeIntervalSince1970: timeStamp!)
        
        
        /***** NSDateFormatter Part *****/
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        formatter.timeStyle = DateFormatter.Style.short
        
        let dateString :String! = formatter.string(from: date)
        //dateString now contains the string:
        //  "December 25, 2016 at 7:00:00 AM"
        
        return (dateString)!
        
        
        
    }
    
    func setOrderStatus() -> String{
        
        switch (self.order?.status)! {
        case 1:
            return "Oczekujące"
        case 2:
            return "Zaakceptowane"
        default:
            return ""
        }
        
    }
    
    
}

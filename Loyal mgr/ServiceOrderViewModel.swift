//
//  ServiceOrderViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 26/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
protocol ServiceOrderViewModelDelegate{
    
    func changeDateOfPicker(date: Date)
    func didFetchItems()
    func didMakeOrder()
    func error(errorTxt: String)
}
class ServiceOrderViewModel{
    
    var delegate: ServiceOrderViewModelDelegate?
    var service: Service?
    var place: Place?
    var selectedDiscount: Discount?
    
    var discounts:[Discount] = [Discount]()
    var pickerData: [String] = [String]()
    var lastCorrectDate: Date?
    
    init(vc: ServiceOrderViewModelDelegate, service: Service, place: Place) {
        self.delegate = vc
        self.place = place;
        self.service = service;
        pickerData = ["Nie masz jeszcze rabatów"]
       // lastCorrectDate = Date().addingTimeInterval(60*60*2).nearestHour()
    }
    
    
    func fetchItems()
    {
        
        
       
        let userId = Auth.sharedInstance.user?.id
        API.sharedInstance.getMyDiscounts(id: userId!, completion: { array, error in
            
            
            if(array != nil ){
                
                self.pickerData = []
                

                let userId = Auth.sharedInstance.user?.id
                let discount = Discount(name: "Brak rabatów", percentage: 0, userId: userId!, cost: 0)
                self.pickerData.append(discount.name)
                self.discounts.append(discount)
                
                
                
                
                for obj  in array!
                {
                    let dic : NSDictionary = obj as! NSDictionary
                    let discount = Discount(dic: dic)
                    let name =  dic.object(forKey: "name")
                    self.pickerData.append(name as! String)
                    self.discounts.append(discount)
                }

                self.selectedDiscount = self.discounts.first
                self.delegate?.didFetchItems()
                
                
            }
        })
        
        
        
        
        
        
        
        
        
    }
    
    func pickerDidSelectRow(row: Int){
        
        self.selectedDiscount = discounts[row]
        
    }
    
    
    func datePickerAction(pickerDate: Date){
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        //var strDate = dateFormatter.string(from: pickerDate)
        let calendar = Calendar(identifier: .gregorian)
        //calendar.firstWeekday = 2
        let comp = calendar.dateComponents([.hour,.weekday], from: pickerDate)
        let hour = comp.hour
        let weekday = comp.weekday
        //sb -> 7
        //nd -> 1
        //pn -> 2
        
        //wez odpowieni dzien
        
       // let placeDay: Day = (self.place?.available![weekday!])!

        for day: Day in (self.place?.available)!
        {
            if day.name == getDayOfWeek(weekday: weekday!){
                
                let workingDay: Bool = day.workingDay!
                let openingHour: Int = Int(day.opens!)!
                let closingHour: Int = Int(day.closes!)!
                if(  hour! >= openingHour && hour! < closingHour )
                {
                   
                    lastCorrectDate = pickerDate
                    if(lastCorrectDate != nil){
                        delegate?.changeDateOfPicker(date: lastCorrectDate!)
                    }
                }else{
                    if(lastCorrectDate != nil){
                        delegate?.changeDateOfPicker(date: lastCorrectDate!)
                    }
                   
                }
                
            }
            
        }
      
    }
    func getDayOfWeek(weekday:Int) -> String {
        if(weekday == 1) {
            return "Sunday"
        }
        else if(weekday == 2) {
            return "Monday"
        }
        else if(weekday == 3) {
            return "Tuesday"
        }
        else if(weekday == 4) {
            return "Wednesday"
        }
        else if(weekday == 5) {
            return "Thursday"
        }
        else if(weekday == 6) {
            return "Friday"
        }
        else {
            return "Saturday"
        }
        
    }
    
    func loadJson(filename fileName: String) -> NSArray?
    {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        print(jsonData!)
        let jsonResult: NSArray = try! JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        return jsonResult
        
        
    }
    
    func formOrder(){
        
        
        if( lastCorrectDate != nil){
        

        let userId: Int = (Auth.sharedInstance.user?.id)!
        let serviceId: Int = (self.service?.id)!
        let discountId: Int = self.selectedDiscount!.id
        let timestamp: Double = (lastCorrectDate?.nearestHour()!.timeIntervalSince1970)!
        
        
        
        API.sharedInstance.makeOrder(userId: userId, serviceId: serviceId, discountId: discountId, timestampForService: timestamp, completion:{
            status,error in
        
        
            Auth.sharedInstance.updateUserData()
            self.delegate?.didMakeOrder()
        
        } )
       
            
        
        
    
    

    }else{
    
            self.delegate?.error(errorTxt: "Please choose the correct date")
    }
        
    }
}
extension Date {
    func nearestHour() -> Date? {
        var components = NSCalendar.current.dateComponents([.minute], from: self)
        let minute = components.minute ?? 0
        components.minute = minute >= 30 ? 60 - minute : -minute
        return Calendar.current.date(byAdding: components, to: self)
    }
}

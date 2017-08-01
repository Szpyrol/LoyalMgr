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
}
class ServiceOrderViewModel{
    
    var delegate: ServiceOrderViewModelDelegate?
    var service: Service?
    var place: Place?
    
    var pickerData: [String] = [String]()
    var lastCorrectDate: Date?
    
    init(vc: ServiceOrderViewModelDelegate, service: Service, place: Place) {
        self.delegate = vc
        self.place = place;
        self.service = service;
        pickerData = ["Nie masz jeszcze rabatów"]
        
    }
    
    
    func fetchItems()
    {
        
        let listOfDiscounts :NSArray = loadJson(filename: "userDiscounts")!
        
        pickerData = []
        for obj  in listOfDiscounts
        {
            let dic : NSDictionary = obj as! NSDictionary
            let name =  dic.object(forKey: "name")
            pickerData.append(name as! String)
        }
        
        self.delegate?.didFetchItems()
        
        
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
                if( !workingDay || hour! < openingHour || hour! > closingHour )
                {
                    print("wrong")
                    if(lastCorrectDate != nil){
                        delegate?.changeDateOfPicker(date: lastCorrectDate!)
                    }
                }else
                {
                    lastCorrectDate = pickerDate
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
    

    
    
}

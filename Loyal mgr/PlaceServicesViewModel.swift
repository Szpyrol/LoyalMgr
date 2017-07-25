//
//  PlaceServicesViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
protocol PlaceServicesViewModelDelegate{
    func didFetchItems()
    func didChooseService(service: Service)
}

class PlaceServicesViewModel{
    
    var services:[Service] = [Service]()
    var servicesViewModels:[ServiceCellViewModel]? = [ServiceCellViewModel]()
    var delegate: PlaceServicesViewModelDelegate?
    
    init(viewController: PlaceServicesViewModelDelegate) {
        self.delegate = viewController
        
    }
    
    func fetchItems(){
    
        let listOfServices :NSArray = loadJson(filename: "servicesList")!
        print(listOfServices)
        for dic in listOfServices
        {
            
            let newService =  Service(dic: dic as! NSDictionary)
            services.append(newService)
            servicesViewModels?.append(ServiceCellViewModel(service: newService))
        }
        
        self.delegate?.didFetchItems()
        
    }
    
    func loadJson(filename fileName: String) -> NSArray?
    {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        print(jsonData!)
        let jsonResult: NSArray = try! JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        return jsonResult
        
        
    }
    
    func modelAtIndex(index: IndexPath) -> ServiceCellViewModel?{
        
        let cellModel:ServiceCellViewModel? = (self.servicesViewModels?[index.row])
        
        return cellModel
    }
    
    func chooseService(index: Int){
        self.delegate?.didChooseService(service: self.services[index])
    }
    
    
    
}

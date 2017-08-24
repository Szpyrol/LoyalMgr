//
//  OrdersListViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

protocol OrdersListViewModelDelegate: class {
    func didFetchItems()
    func didChooseOrder(order: Order)
}

class OrdersListViewModel{
    
    weak var delegate: OrdersListViewModelDelegate?
    var ordersArray  = [Order]()
    var ordersCellsViewModels = [OrderCellViewModel]()
    
    
    init(viewController: OrdersListViewModelDelegate) {
        self.delegate = viewController
        
    }
    func modelAtIndex(index: Int)-> OrderCellViewModel{
        return ordersCellsViewModels[index]
    }
    
    func didChooseServiceToShow(index: Int){
        self.delegate?.didChooseOrder(order: ordersArray[index])
        
    }
    func fetchItems(){
    
        API.sharedInstance.getOrdersForUser(completion: {array,error in
        
            if(array != nil){
                
                for json in array!
                {
                    let order: Order = Order(dic: json as! Dictionary<String, Any>)
                    self.ordersArray.append(order)
                    self.ordersCellsViewModels.append(OrderCellViewModel(order: order))
                    
                    
                }
                self.delegate?.didFetchItems()
            }
        
        
        
        
        
        })
        
        
    
    }
    
    
    
    
    
    
}

//
//  OrdersListViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

protocol OrdersListViewModelDelegate: class {
    func didFetchItems()
}

class OrdersListViewModel{
    
    weak var delegate: OrdersListViewModelDelegate?
    
    init(viewController: OrdersListViewModelDelegate) {
        self.delegate = viewController
        
    }
    
    func fetchItems(){
    
    
    }
    
    
    
    
    
    
}

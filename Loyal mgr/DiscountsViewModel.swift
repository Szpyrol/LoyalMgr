//
//  DiscountsViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

protocol DiscountsViewModelDelegate: class {
    func didFetchItems()
}

class DiscountsViewModel{
    
    weak var delegate: DiscountsViewModelDelegate?
    
    init(viewController: DiscountsViewModelDelegate) {
        self.delegate = viewController
        
    }
    
    func fetchItems(){
        
        
    }
    
    
    
    
    
    
}

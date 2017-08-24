//
//  DiscountsViewModel.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//
import Foundation
protocol DiscountsViewModelDelegate: class {
    func didFetchItems()
    func didBuyDicount()
    func errorToShow(errorTxt: String)
}

class DiscountsViewModel{
    
    weak var delegate: DiscountsViewModelDelegate?
    
    var cellViewModels = [DiscountCellViewModel]()
    var discountsList = [Discount]()
    
    init(viewController: DiscountsViewModelDelegate) {
        self.delegate = viewController
        
    }
    
    
    func fetchItems(){
        let userId = Auth.sharedInstance.user?.id
       
        API.sharedInstance.getDiscountsTypes(completion: { array, error in
            
            for dic in array! {
                let discount = Discount(dicType: dic as! NSDictionary, userId: userId!)
                self.discountsList.append(discount)
                self.cellViewModels.append(DiscountCellViewModel(discount: discount))
            }
            
            
        self.delegate?.didFetchItems()
        })
        
        
        
        
    }
    
    
    func buy(index:Int){
        
        let discount = self.discountsList[index]
        
        API.sharedInstance.buyDiscountFor(user: Auth.sharedInstance.user!, discount: discount, completion: {status,error in
        
            if( error != nil){
                self.delegate?.errorToShow(errorTxt: error!)
            }else{
                
                self.delegate?.didBuyDicount()
                
                
                
            }
            
            
        }
        )
        
        
    }

    
    
    
}

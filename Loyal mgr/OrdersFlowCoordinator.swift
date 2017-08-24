//
//  OrdersFlowCoordinator.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class OrdersFlowCoordinator: FlowCoordinator {
    let configure : FlowConfigure!
    var childFlow : FlowCoordinator?
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        
        
        let storyboard = UIStoryboard(name: "Orders", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"OrdersViewController") as! OrdersViewController
        viewController.viewModel = OrdersListViewModel(viewController: viewController)
        viewController.viewModel?.fetchItems()
        viewController.delegate = self
        configure.navigationController?.pushViewController(viewController, animated: false)
        
    }
    func startServiceController(service: Service){
        
        let storyboard = UIStoryboard(name: "PlaceDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"ServiceDetailsViewController") as! ServiceDetailsViewController
        
        viewController.viewModel = ServiceDetailsViewModel(initService: service)
        configure.navigationController?.pushViewController(viewController, animated: true)
    }

}

extension OrdersFlowCoordinator : OrdersViewControllerDelegate{
    func didChooseOrder(order: Order) {
        startServiceController(service: order.service!)
    }
}


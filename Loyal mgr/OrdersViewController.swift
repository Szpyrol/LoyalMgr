//
//  OrdersViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import SideMenu

protocol OrdersViewControllerDelegate: class{
    func didChooseOrder()
}

class OrdersViewController: UITableViewController {

    
    
    
    
    
    func menuButtonPressed(){
        
        self.present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Moje zamówienia"
        
        let menuIcon = String.fontAwesomeIcon(code: "fa-bars")
        let leftButton = UIBarButtonItem(title: menuIcon, style: .plain, target: self, action: #selector(self.menuButtonPressed))
        leftButton.setTitleTextAttributes([NSFontAttributeName:UIFont.fontAwesome(ofSize: 20)], for: .normal)
        self.navigationItem.leftBarButtonItem = leftButton
        
        
        
        self.tableView.register(UINib(nibName: "OrderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "OrderTableViewCell")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//viewModel.places.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell :OrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        
       // cell.setCellModel(cellModel: (viewModel?.modelAtIndex(index: indexPath))!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("did select row")
        //viewModel.didChoosePlaceToShow(indexPath: indexPath)
        
    }
    


}

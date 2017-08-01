//
//  DiscountsViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import SideMenu


class DiscountsViewController: UITableViewController {

    
    func menuButtonPressed(){
        
        self.present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Dostępne rabaty"
        let menuIcon = String.fontAwesomeIcon(code: "fa-bars")
        let leftButton = UIBarButtonItem(title: menuIcon, style: .plain, target: self, action: #selector(self.menuButtonPressed))
        leftButton.setTitleTextAttributes([NSFontAttributeName:UIFont.fontAwesome(ofSize: 20)], for: .normal)
        self.navigationItem.leftBarButtonItem = leftButton
        

        
        self.tableView.register(UINib(nibName: "DiscountTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "DiscountTableViewCell")
        
        
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
        
        let cell :DiscountTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DiscountTableViewCell", for: indexPath) as! DiscountTableViewCell
        
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

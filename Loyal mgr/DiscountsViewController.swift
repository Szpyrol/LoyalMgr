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

    var viewModel:DiscountsViewModel?
    
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
        return (viewModel?.cellViewModels.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell :DiscountTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DiscountTableViewCell", for: indexPath) as! DiscountTableViewCell
        
        let discountViewModel = (viewModel?.cellViewModels[indexPath.row])!
         cell.setCellModel(cellViewModel: discountViewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//      viewModel.
        //viewModel.didChoosePlaceToShow(indexPath: indexPath)
        
        let alert = UIAlertController(title: "Question", message: "Are you sure you want to buy this?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.default, handler: {_ in
            self.viewModel?.buy(index: indexPath.row)
        }))
        
        alert.addAction(UIAlertAction(title: "NO", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)

        
        
        
    }
    


}

extension DiscountsViewController: DiscountsViewModelDelegate{
    
    func didFetchItems() {
        self.tableView.reloadData()
        
    }
    func didBuyDicount() {
        
        
        Auth.sharedInstance.updateUserData()
        
        let alert = UIAlertController(title: "Success", message: "You have a new discount now! You will see it when ordering a new service!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Thanks!", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        

        
    }
    func errorToShow(errorTxt: String) {
        
        
        let alert = UIAlertController(title: "Error", message: errorTxt, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        

        
        
        
    }
    
}

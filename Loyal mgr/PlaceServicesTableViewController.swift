//
//  PlaceServicesTableViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
protocol PlaceServicesTableViewControllerDelegate{
    func didChooseService(service: Service)
}
class PlaceServicesTableViewController: UITableViewController {

    var viewModel: PlaceServicesViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "ServiceTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ServiceTableViewCell")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let count = viewModel?.servicesViewModels?.count
        if(count != nil){
            return count!
        }else{
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell :ServiceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as! ServiceTableViewCell
        let cellViewModel: ServiceCellViewModel? = viewModel?.modelAtIndex(index: indexPath)
        if(cellViewModel != nil)
        {
            cell.setCellViewModel(cellViewModel: (cellViewModel))
        }
        //cell.setCellViewModel(cellViewModel: (viewModel?.modelAtIndex(index: indexPath))!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    

}
extension PlaceServicesTableViewController: PlaceServicesViewModelDelegate{
    func didFetchItems() {
        self.tableView.reloadData()
    }
    func didChooseService(service: Service) {
        
        self.didChooseService(service: service)
        
    }
    
}

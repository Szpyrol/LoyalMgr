//
//  PlacesListTableViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

protocol PlaceListTableViewControllerDelegate: class {
    func didChoosePlace(place: Place)
}
class PlacesListTableViewController: UITableViewController {

    var viewModel: PlacesListViewModel!
    weak var delegate: PlaceListTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "PlaceTableViewCell")

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell :PlaceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
        
        cell.setCellModel(cellModel: (viewModel?.modelAtIndex(index: indexPath))!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("did select row")
        viewModel.didChoosePlaceToShow(indexPath: indexPath)
        
    }
    
    
   }
extension PlacesListTableViewController: PlacesListViewModelDelegate{
    
    func didSetPlaces() {
        self.tableView.reloadData()
    }
    func didChoosePlace(place: Place){
        self.delegate?.didChoosePlace(place: place)
        
    }
}

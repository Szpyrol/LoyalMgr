//
//  ServiceOrderViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 26/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
protocol  ServiceOrderViewControllerDelegate {
    func didPressSendRequest()
}
class ServiceOrderViewController: UIViewController {

    @IBOutlet weak var discountPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: ServiceOrderViewControllerDelegate?
    
    var viewModel: ServiceOrderViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.minimumDate = Date().addingTimeInterval(60*60*2)
        datePicker.maximumDate = Date().addingTimeInterval(60*60*24*7*2)//two weeks time
        
        self.discountPicker.delegate = self;
        self.discountPicker.dataSource = self;
        viewModel?.fetchItems()
        viewModel?.datePickerAction(pickerDate: datePicker.date)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func datePickerAction(_ sender: Any) {
        viewModel?.datePickerAction(pickerDate: datePicker.date)
    }
    
    @IBAction func sendRequest(_ sender: Any) {
        
        //jaki user (id)
        //jaki servis (id)
        //jaki timestamp
        //jaki rabat(id)
       
        self.viewModel?.formOrder()
        
        
        
        
            }
}

extension ServiceOrderViewController: ServiceOrderViewModelDelegate{
    func changeDateOfPicker(date: Date) {
        self.datePicker.setDate(date, animated: true)
    }
    func didFetchItems() {
        self.discountPicker.reloadAllComponents()
    }
    func didMakeOrder() {
        let alert = UIAlertController(title: "Success", message: "We did send and order to place", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: { txt in
         self.delegate?.didPressSendRequest()
            
        })
        
       

    }
    func error(errorTxt: String) {
        let alert = UIAlertController(title: "Error", message: errorTxt, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension ServiceOrderViewController: UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel!.pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.viewModel?.pickerDidSelectRow(row: row)
    }
    
}




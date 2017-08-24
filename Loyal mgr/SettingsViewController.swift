//
//  SettingsViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import SideMenu


protocol SettingsViewControllerDelegate: class {
    
    
}
class SettingsViewController: UITableViewController {

    weak var delegate: SettingsViewControllerDelegate?
    
    var viewModel: SettingsViewModel?
    
    @IBOutlet weak var firstNameCell: FormTableViewCell!
    @IBOutlet weak var lastNameCell: FormTableViewCell!
    @IBOutlet weak var passwordCell: FormTableViewCell!
    @IBOutlet weak var repeatPasswordCell: FormTableViewCell!
    @IBOutlet weak var phoneCell: FormTableViewCell!

    @IBAction func sendChangeDataRequest(_ sender: Any) {
        
        
        
    }
    
    
    
    
    func menuButtonPressed(){
        
        self.present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
        
    }
    func refreshUserData(){
        
       self.firstNameCell.textField.text = self.viewModel?.getfirstName()
        self.lastNameCell.textField.text = self.viewModel?.getlastName()
        self.phoneCell.textField.text = self.viewModel?.getphone()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Ustawienia"
        
        let menuIcon = String.fontAwesomeIcon(code: "fa-bars")
        let leftButton = UIBarButtonItem(title: menuIcon, style: .plain, target: self, action: #selector(self.menuButtonPressed))
        leftButton.setTitleTextAttributes([NSFontAttributeName:UIFont.fontAwesome(ofSize: 20)], for: .normal)
        self.navigationItem.leftBarButtonItem = leftButton

        // Do any additional setup after loading the view.
        refreshUserData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
}
extension SettingsViewController: SettingsViewModelDelegate{
    func didSendData() {
        
    }
}

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
        
        viewModel?.validateForms(firstName: firstNameCell.textField.text, lastName: lastNameCell.textField.text, phone: phoneCell.textField.text, password1: passwordCell.textField.text, password2: repeatPasswordCell.textField.text)
        
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
    func showMgs(txt: String) {
        let alert = UIAlertController(title: "Walidacja", message: txt, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    func didSendData(params: Dictionary<String,String>) {
        API.sharedInstance.updateUserData(params: params, completion:  {(services, error) in
            Auth.sharedInstance.updateUserData(completionUpdate:
                {completed in
            self.refreshUserData();
                    let alert = UIAlertController(title: "Sukces", message: "Dane zostały zapisane na serwerze", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
            })
            
        })
    
}
}

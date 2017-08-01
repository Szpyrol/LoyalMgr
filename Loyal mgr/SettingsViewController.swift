//
//  SettingsViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import SideMenu

class SettingsViewController: UITableViewController {

    func menuButtonPressed(){
        
        self.present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Ustawienia"
        
        let menuIcon = String.fontAwesomeIcon(code: "fa-bars")
        let leftButton = UIBarButtonItem(title: menuIcon, style: .plain, target: self, action: #selector(self.menuButtonPressed))
        leftButton.setTitleTextAttributes([NSFontAttributeName:UIFont.fontAwesome(ofSize: 20)], for: .normal)
        self.navigationItem.leftBarButtonItem = leftButton

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

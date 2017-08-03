//
//  RegisterViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class RegisterViewController: UITableViewController {
    
    @IBOutlet weak var firstCell: FormTableViewCell!
    @IBOutlet weak var surnameCell: FormTableViewCell!
    @IBOutlet weak var passwordCell: FormTableViewCell!
    @IBOutlet weak var passwordRepeatCell: FormTableViewCell!
    @IBOutlet weak var phoneCell: FormTableViewCell!
    @IBOutlet weak var emailCell: FormTableViewCell!
    
    
    
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Register"
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

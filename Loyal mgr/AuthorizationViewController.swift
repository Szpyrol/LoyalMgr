//
//  AuthorizationViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
protocol AuthorizationViewControllerDelegate: class  {
    func didPressLogin()
    func didPressRegister()
}
class AuthorizationViewController: UIViewController {

     var delegate: AuthorizationViewControllerDelegate?
    
    @IBAction func signIn(_ sender: Any) {
        self.delegate?.didPressLogin()
    }
    @IBAction func signUp(_ sender: Any) {
        self.delegate?.didPressRegister()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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

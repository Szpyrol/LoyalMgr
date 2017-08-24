//
//  LoginViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
protocol LoginViewControllerDelegate{
    func didFinishSigning()
}
class LoginViewController: UITableViewController {

    
    
    @IBOutlet weak var emailCell: FormTableViewCell!
    @IBOutlet weak var passwordCell: FormTableViewCell!
    var viewModel: LoginViewModel?
    var delegate: LoginViewControllerDelegate?
    
    
    @IBAction func signIn(_ sender: Any) {
        viewModel?.signIn(emailCell: emailCell, passwordCell: passwordCell)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
        
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
extension LoginViewController: LoginViewModelDelegate{
    
    func didSignIn() {
        
        self.delegate?.didFinishSigning()
    }
    func didNotSignInWithError(errorTxt: String) {
        let alert = UIAlertController(title: "Erorr", message: errorTxt, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

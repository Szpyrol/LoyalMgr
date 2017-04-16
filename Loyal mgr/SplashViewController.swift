//
//  SplashViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
protocol SplashViewControllerDelegate {
    func splashViewControllerDidFinished()
}

class SplashViewController: UIViewController {

    var delegate:SplashViewControllerDelegate?
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn], animations: { () -> Void in
            // Fade in
            self.view.backgroundColor = UIColor.green
            self.label.alpha = 1.0
            
        }) { (success) -> Void in
            // Fade out
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseOut], animations: { () -> Void in
                self.view.backgroundColor = UIColor.white
                self.label.alpha = 0.0
                
            }) { (success) -> Void in
                self.presentNextScreen()
            }
        }

        
        
        // Do any additional setup after loading the view.
    }
    
    func presentNextScreen() {
        self.delegate?.splashViewControllerDidFinished()
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

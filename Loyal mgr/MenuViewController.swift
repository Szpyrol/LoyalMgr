//
//  MenuViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 26/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate{
    func didChooseFromMenu(index: Int)
}
class MenuViewController: UITableViewController {

    var delegate: MenuViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath:", indexPath.row)
        delegate?.didChooseFromMenu(index: indexPath.row)
        
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

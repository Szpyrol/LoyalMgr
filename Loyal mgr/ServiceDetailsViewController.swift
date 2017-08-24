//
//  ServiceDetailsViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
protocol ServiceDetailsViewControllerDelegate {
    func wishToOrder(service: Service )
}
class ServiceDetailsViewController: UIViewController {

    var viewModel:ServiceDetailsViewModel?
    var delegate: ServiceDetailsViewControllerDelegate?
    
    @IBOutlet weak var serviceImg: UIImageView!
    @IBOutlet weak var serviceDescription: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = viewModel?.titleText
        self.serviceDescription.text = viewModel?.serviceDescription
        self.serviceImg.sd_setImage(with: viewModel?.imageUrl)
        if(delegate == nil ){
            self.orderBtn.isHidden = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func orderAction(_ sender: Any) {
        delegate?.wishToOrder(service: (viewModel?.service)!)
    }
    
    
    
    

}

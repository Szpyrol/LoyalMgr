//
//  PlaceDetailsViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
protocol PlaceDetailsViewControllerDelegate{
        func didChooseToCheckServices()
}
class PlaceDetailsViewController: UIViewController{
    
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeDescription: UILabel!
    
     var delegate: PlaceDetailsViewControllerDelegate?
    
    var viewModel: PlaceDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.titleText
        placeImage.sd_setImage(with: URL(string: viewModel.imageUrl) )
        placeDescription.text = viewModel.descriptionText

        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func checkServices(_ sender: Any) {
        self.delegate?.didChooseToCheckServices()
    }
    
}

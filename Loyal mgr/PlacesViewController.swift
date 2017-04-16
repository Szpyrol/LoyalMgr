//
//  PlacesViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 15/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

protocol PlacesViewControllerDelegate {
    func PlacesViewControllerDidFinish()
    
}

class PlacesViewController: UIViewController {

    @IBOutlet weak var segmentationBar: Segmentation!
    @IBOutlet weak var welcomeLabel: UILabel!
    var delegate: PlacesViewControllerDelegate?
    var viewModel: PlacesViewModel?
    
    var listVC: PlacesListTableViewController?
    var mapVC: PlacesMapViewController?
    var navigationBarHeight: CGFloat!
    
    @IBOutlet weak var scrollView: UIScrollView!
   
    
    func initView() {
       
        
        navigationBarHeight = self.navigationController!.navigationBar.frame.height
         let subViewHeight: CGFloat =
            self.view.frame.height
            //- self.welcomeLabel.frame.height
           // - self.segmentationBar.frame.height
        
        listVC?.view.frame = CGRect(x: 0,
                                    y: 0,
                                    width: self.view.frame.width,
                                    height: subViewHeight)
        
        mapVC?.view.frame = CGRect( x: self.view.frame.width,
                                    y: 0,
                                    width: self.view.frame.width,
                                    height: subViewHeight)
        
        scrollView.addSubview((listVC?.view)!)
        scrollView.addSubview((mapVC?.view)!)
        scrollView.contentInset = .zero
        scrollView.contentSize = CGSize(width: 2*self.view.frame.width,
                                        height: navigationBarHeight)
        scrollView.bounces = false
        
        
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.initView()
        segmentationBar.addButton(text: "List", imageTxt: "fa-list")
        segmentationBar.addButton(text:"Map", imageTxt: "fa-map")
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
               // Do any additional setup after loading the view.
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }

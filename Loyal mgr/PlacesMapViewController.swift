//
//  PlacesMapViewController.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 16/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import MapKit

class PlacesMapViewController: UIViewController {

    var viewModel: PlacesMapViewModel?
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
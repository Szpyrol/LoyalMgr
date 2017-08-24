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
    var lastShownAnnotation : MKAnnotationView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.mapView.delegate = self
        
        
        var ann = MKPointAnnotation()
        
        ann.title = "The title";
        ann.subtitle = "A subtitle";
        ann.coordinate =  CLLocationCoordinate2D(latitude:  53.0 , longitude: 19.0 )
        self.mapView.addAnnotation(ann)
        
        
    let coordinate = CLLocationCoordinate2D(latitude:  53.0 , longitude: 19.0 )
        
        
        
        let coordinateq = CLLocationCoordinate2D(latitude:  53.0 , longitude: 21.0 )
        
        // Do any additional setup after loading the view.
        let annotation = Establishment(title: "Place", locationName: "Desc", coordinate: coordinate)
        let annotationq = Establishment(title: "Place", locationName: "Desc", coordinate: coordinateq)
        
    
       
        
        
        
       // let myAn1 = MyAnnonation(title: "Office", coordinate: location, subtitle: "MyOffice");
        
       // let myAn2 = MyAnnonation(title: "Office 1", coordinate: locationSec, subtitle: "MyOffice 1");
        
        mapView.addAnnotation(annotation);
        mapView.addAnnotation(annotationq);
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPlace(){}
    

   
}

extension PlacesMapViewController: MKMapViewDelegate {
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? Establishment {
            
            let identifier = "Callout"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil{
                annotationView = AnnotationView(annotation: annotation, reuseIdentifier: "Callout")
                
              //  annotationView?.canShowCallout = true
            }
            
          
            
            return annotationView
        }
        return nil
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // 1
        
        if view.annotation is MKUserLocation
        {
            return
        }
        // 2
        
        removeLastAnnotationView()
        let annotation = view.annotation as! Establishment
        let views = Bundle.main.loadNibNamed("MapCalloutView", owner: self, options: nil)
        
        
        let calloutView = views?[0] as! MapCalloutView
      
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PlacesMapViewController.showPlace))
        calloutView.addGestureRecognizer(tapGesture)
        calloutView.isUserInteractionEnabled = true
        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
        view.addSubview(calloutView)
        
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
        lastShownAnnotation = view
        
        
    }
   
    
    
    func removeLastAnnotationView(){
        if(lastShownAnnotation != nil)
        {
            for subview in lastShownAnnotation.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }
    func closeButton(sender: AnyObject){
        
        removeLastAnnotationView()
        
        
    }
    
    func mapView(mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
       /* if view.isKindOfClass(AnnotationView.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }*/
    }
    
}


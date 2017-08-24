//
//  AnnotationView.swift
//  Raisin
//
//  Created by Łukasz Szpyrka on 08/11/2016.
//  Copyright © 2016 Raisin SAS. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {

    
    /*override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        //let hitView :UIView =
        //if(hitView != nil){
            self.superview?.bringSubviewToFront(self)
            
        //}
       return super.hitTest(point, withEvent: event)!
    }
    */
    
   /* override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, withEvent: event)
        if hitView != nil {
            superview?.bringSubviewToFront(self)
        }
        return hitView

        
        
    }
    
  
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        let rect = self.bounds
        var isInside = CGRectContainsPoint(rect, point)
        if !isInside {
            for view in subviews {
                isInside = CGRectContainsPoint(view.frame, point)
                if isInside {
                    break
                }
            }
        }
        return isInside
    }
    */
    
}

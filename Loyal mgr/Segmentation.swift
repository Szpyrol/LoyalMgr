//
//  Segmentation.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 16/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import FontAwesome_swift

class Segmentation: UIView {

   
    var line:UIView!
    static let lineHeight:CGFloat = 3
    var buttons:Array<SegmentBox>!
    var buttonWidth: CGFloat = 375
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buttons = Array<SegmentBox>()
        line = UIView(frame: CGRect(x: 0,
                                   y: self.frame.height-Segmentation.lineHeight,
                                   width: self.frame.width,
                                   height: Segmentation.lineHeight))
        line.backgroundColor = UIColor.gray
        self.addSubview(line!)
        
        
        
    }
    
    func addButton(text:String , imageTxt:String){
        
        let buttonsNumbToDevide: CGFloat = CGFloat(((buttons?.count)!+1))
        buttonWidth = (self.frame.size.width / buttonsNumbToDevide) - 1.0
        let xPos :CGFloat = CGFloat((buttons?.count)!) * buttonWidth
        
        let box: SegmentBox = SegmentBox(frame: CGRect(
            x:  xPos ,
            y: 0,
            width: buttonWidth,
            height: self.frame.size.height))
        
        box.initContent(text: text, imageTxt: imageTxt)
        buttons?.append(box)
        repairButtonsWidth()
        self.addSubview(box)
        
    }
   
    func repairButtonsWidth(){
        
        let btnCount:CGFloat = CGFloat((buttons?.count)!)
        for box in self.buttons! {
            box.setFrame(frame: CGRect(
                x: btnCount * buttonWidth + btnCount ,
                y: 0,
                width: buttonWidth,
                height: self.frame.height))
          
        }
    }
    
}
class SegmentBox: UIView{
    
    var label:UILabel!
    var image:UILabel!
    
    
    func setFrame(frame: CGRect){
       
        image.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height*2/3)
        label.frame = CGRect(x: 0 , y: frame.height*2/3-5 , width: frame.width, height: frame.height*1/3 )
    }
    func initContent(text:String , imageTxt:String){
        
        label.text = text
        image.font = UIFont.fontAwesome(ofSize: 20)
        image.text = String.fontAwesomeIcon(code: imageTxt)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        
        image = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height*2/3))
        image.textAlignment = .center
        
        label = UILabel(frame: CGRect(x: 5 , y: frame.height*2/3 ,
                                      width: frame.width,
                                      height: frame.height*1/3 - Segmentation.lineHeight
        ) )

        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 12.0)
        self.backgroundColor = UIColor.white
        
        self.addSubview(image)
        self.addSubview(label)
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

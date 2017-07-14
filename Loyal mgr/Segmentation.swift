//
//  Segmentation.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 16/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import FontAwesome_swift


protocol SegmentationDelegate: class {
    func didPressButton(button: Int)
}


class BoxGestureRecognizer: UITapGestureRecognizer {
    var box: SegmentBox!
}
class Segmentation: UIView {

   

    var progressLine:UIView!
    static let lineHeight:CGFloat = 1
    var buttons:Array<SegmentBox>!
    var buttonWidth: CGFloat = 0
    var numbOfBtns: CGFloat = 0
    weak var delegate:SegmentationDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buttons = Array<SegmentBox>()

        progressLine = UIView(frame: CGRect(x: 0,
                                    y: self.frame.height-Segmentation.lineHeight,
                                    width: 0,
                                    height: Segmentation.lineHeight))
        
        
        progressLine.backgroundColor = UIColor.darkGray
        progressLine.layer.cornerRadius = 2.0
        self.addSubview(progressLine)
        
        
        
        
    }
    
    func setHighLightLine(offset: CGFloat){
        
       progressLine.frame = CGRect(
               x: offset / CGFloat(buttons.count),
               y: self.frame.size.height - Segmentation.lineHeight,
               width: self.buttonWidth,
               height: Segmentation.lineHeight)
        
        
    /*     CGRect(x: btnFrame.origin.x,
                                            y: self.frame.height-Segmentation.lineHeight,
                                            width: btnFrame.size.width,
                                            height: Segmentation.lineHeight)
     */   self.bringSubview(toFront: progressLine)
    }
    func addButton(text:String , imageTxt:String){
        
        numbOfBtns = CGFloat(((buttons?.count)!+1))
        buttonWidth = (self.frame.size.width / numbOfBtns) - 1.0
        
        
        let box: SegmentBox = SegmentBox()
        
        buttons?.append(box)
        repairButtonsWidth()
        box.initContent(text: text, imageTxt: imageTxt,btnIndex: buttons.count )
        let tap :BoxGestureRecognizer = BoxGestureRecognizer(target: self, action: #selector(self.didPressBtn(sender:)))
        tap.box = box
        box.addGestureRecognizer(tap)
        self.addSubview(box)
        
    }
    func didPressBtn( sender:  BoxGestureRecognizer){
        
        
        self.delegate?.didPressButton(button: sender.box.index)
    }
    func repairButtonsWidth(){
        
       
        var xPos :CGFloat =  0.0
        for var box in self.buttons {
            setFrameFor(box: &box, frame: CGRect(
                x:xPos,
                y: 0,
                width: buttonWidth,
                height: self.frame.height-Segmentation.lineHeight))
            xPos +=  buttonWidth+1
        
          
        }
    }
    func setFrameFor(box: inout SegmentBox, frame: CGRect){
    
        box.frame = frame
        box.image.frame = CGRect(x: 0,
                                 y: 0,
                             width: frame.width,
                             height: frame.height*2/3)
        box.label.frame = CGRect(x: 0 ,
                                 y: frame.height*2/3 ,
                             width: frame.width,
                             height: frame.height*1/3 )
        
        
    }
    
    
}



class SegmentBox: UIView{
    
    var label:UILabel!
    var image:UILabel!
    var index:Int!
    
    func setFrame(frame: CGRect){
        
        image.frame = CGRect(x: 0, y: 0,
                             width: frame.width,
                             height: frame.height*2/3)
        label.frame = CGRect(x: 0 , y: frame.height*2/3-15 ,
                             width: frame.width,
                             height: frame.height*1/3 )
        self.frame = frame
    }
    func initContent(text:String , imageTxt:String, btnIndex:Int){
        
        //image.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height*2/3)
        image.textAlignment = .center
        
       /* label.frame =  CGRect(x: 0 ,
                                      y: frame.height*2/3 ,
                                      width: frame.width,
                                      height: frame.height*1/3 - Segmentation.lineHeight)
        */
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 12.0)
        self.backgroundColor = UIColor.white
        
        self.addSubview(image)
        self.addSubview(label)

        
        label.text = text
        image.font = UIFont.fontAwesome(ofSize: 20)
        image.text = String.fontAwesomeIcon(code: imageTxt)
        self.index = btnIndex;
        
    }
    convenience init() {
        self.init(frame: CGRect.zero)
        image = UILabel(frame: CGRect.zero)
        label = UILabel()
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}

//
//  OrderTableViewCell.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    var cellModel: OrderCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCellModel(cellModel: OrderCellViewModel){
        self.cellModel = cellModel
        refreshCellData()
    }

    func refreshCellData(){
        
        self.photo.sd_setImage(with: self.cellModel?.getImageUrl())
        self.titleLabel.text = self.cellModel?.getServiceTitle()
        self.statusLabel.text = self.cellModel?.setOrderStatus()
        self.placeName.text = self.cellModel?.getPlaceName()
        self.adressLabel.text = self.cellModel?.getAdress()
        
    }
    
    
}

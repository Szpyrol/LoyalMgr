//
//  PlaceTableViewCell.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 17/04/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var cellModel: PlaceCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCellModel(cellModel: PlaceCellModel){
        self.cellModel = cellModel
        refreshCellData()
    }
    func refreshCellData(){
        self.placeName.text = self.cellModel?.getName()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

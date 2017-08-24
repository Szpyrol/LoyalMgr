//
//  DiscountTableViewCell.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 01/08/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit

class DiscountTableViewCell: UITableViewCell {

    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    
    
    
    
    
    var cellViewModel: DiscountCellViewModel?
    
    
    func setCellModel(cellViewModel: DiscountCellViewModel){
        self.cellViewModel = cellViewModel
        refreshCellData()
    }
    
    func refreshCellData(){
        
        self.percentageLabel.text = cellViewModel?.getPercentage()
        self.nameLabel.text = cellViewModel?.getName()
        
        
        
    }
    

    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

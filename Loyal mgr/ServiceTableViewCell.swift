//
//  ServiceTableViewCell.swift
//  Loyal mgr
//
//  Created by Łukasz Szpyrka on 25/07/2017.
//  Copyright © 2017 Łukasz Szpyrka. All rights reserved.
//

import UIKit
import SDWebImage
class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var serviceImg: UIImageView!
    var viewModel: ServiceCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        // Initialization code
    }

    func setCellViewModel(cellViewModel: ServiceCellViewModel?){
        self.viewModel = cellViewModel
        self.refreshCellData()
    }
    
    func refreshCellData(){
        self.serviceTitle.text = viewModel?.getName()
        self.serviceImg.sd_setImage(with: self.viewModel?.getUrl()! as URL!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

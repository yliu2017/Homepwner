//
//  ItemCell.swift
//  Homepwner1
//
//  Created by Tom Liu's Mac on 3/15/17.
//  Copyright © 2017 Yingqi Liu. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}

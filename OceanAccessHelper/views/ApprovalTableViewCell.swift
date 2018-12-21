//
//  ApprovalTableViewCell.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 12/21/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit

protocol DetailDisclosable {
    var detailDisclosureMessage: String? {get}
}

class ApprovalTableViewCell: UITableViewCell, DetailDisclosable {
    
    @IBInspectable var detailDisclosureMessage: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//
//  BlurTableViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/21/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit

class BlurTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "coa-background")
        let imageView = UIImageView(image: backgroundImage)
        imageView.addBlur(style: .extraLight)
        
        tableView.backgroundView = imageView
        
    }
}

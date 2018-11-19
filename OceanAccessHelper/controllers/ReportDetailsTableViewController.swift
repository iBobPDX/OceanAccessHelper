//
//  ReportDetailsTableViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit

class ReportDetailsTableViewController: UITableViewController, UITextViewDelegate {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var crmcCodeTextField: UITextField!
    @IBOutlet weak var reporterNameTextField: UITextField!
    @IBOutlet weak var reportDateTimePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}

// MARK - UITextViewDelegate
extension ReportDetailsTableViewController {
    //
}

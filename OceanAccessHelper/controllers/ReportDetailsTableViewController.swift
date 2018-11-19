//
//  ReportDetailsTableViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit

class ReportDetailsTableViewController: UITableViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var crmcCodeTextField: UITextField!
    @IBOutlet weak var reporterNameTextField: UITextField!
    @IBOutlet weak var reportDateTimePicker: UIDatePicker!
    
    @IBOutlet weak var peopleWalkersCountTextfield: UITextField!
    @IBOutlet weak var peopleFishermenCountTextField: UITextField!
    @IBOutlet weak var peopleSurfersCountTextField: UITextField!
    @IBOutlet weak var peopleOtherCountTextField: UITextField!
    
    @IBOutlet weak var approvalsCrmcROWSwitch: UISwitch!
    @IBOutlet weak var approvalsCoaAdoptionSignSwitch: UISwitch!
    @IBOutlet weak var approvalsObstructionToROWSwitch: UISwitch!
    @IBOutlet weak var approvalsEncroachmentToPathwaySwitch: UISwitch!
    @IBOutlet weak var approvalsEncroachmentToShorelineSwitch: UISwitch!
    @IBOutlet weak var approvalsWaterAccessSwitch: UISwitch!
    @IBOutlet weak var approvalsParkingSwitch: UISwitch!
    @IBOutlet weak var approvalsVandalismSwitch: UISwitch!
    @IBOutlet weak var approvalsDebrisSwitch: UISwitch!
    
    @IBOutlet weak var commentsTextView: UITextView!
    
    var report: Archive?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier, segueIdentifier == "saveReportDetails" else {
            return
        }
        
        if let reporter = reporterNameTextField.text, let location = locationTextField.text, let crmc = crmcCodeTextField.text {
            self.report = Archive(dateTime:reportDateTimePicker.date,
                            reporterName:reporter,
                            locationName: location,
                            crmcCode:crmc,
                            people:PeopleObservation.none, // FIXME: Need to either break this out into separate fields, or have it be an array of observations
                            crmcRightOfWaySignApproved: approvalsCrmcROWSwitch.isOn,
                            coaAdoptionSignApproved: approvalsCoaAdoptionSignSwitch.isOn,
                            rowObstructionApproved: approvalsObstructionToROWSwitch.isOn,
                            rowPathwayEncroachmentApproved: approvalsEncroachmentToPathwaySwitch.isOn,
                            rowShorelineEncroachmentApproved: approvalsEncroachmentToShorelineSwitch.isOn,
                            pedestrianAccessApproved: approvalsWaterAccessSwitch.isOn,
                            parkingAccessApproved: approvalsParkingSwitch.isOn,
                            freeFromVandalismApproved: approvalsVandalismSwitch.isOn,
                            freeFromMarineDebrisAndLitterApproved: approvalsDebrisSwitch.isOn,
                            comments: commentsTextView.text
            )
        } else {
            // Throw error, return
        }
    }
}

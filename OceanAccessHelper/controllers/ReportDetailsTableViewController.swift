//
//  ReportDetailsTableViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit
import CoreData

class ReportDetailsTableViewController: UITableViewController, ArchiveManagedContext {

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
    
    var managedObjectContext: NSManagedObjectContext? // ArchiveManagedContext
    var report: Archive?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier, segueIdentifier == "saveReportDetails", let managedObjectContext = managedObjectContext else {
            return
        }
        
        if let reporter = reporterNameTextField.text, let location = locationTextField.text, let crmc = crmcCodeTextField.text {
            
            let report = Archive(context: managedObjectContext)
            report.dateTime = reportDateTimePicker.date
            report.reporterName = reporter
            report.locationName = location
            report.crmcCode = crmc
            report.peopleWalkersCount = Int64(peopleWalkersCountTextfield.text ?? "0") ?? 0
            report.peopleFishermenCount = Int64(peopleFishermenCountTextField.text ?? "0") ?? 0
            report.peopleSurfersCount = Int64(peopleSurfersCountTextField.text ?? "0") ?? 0
            report.peopleOtherCount = Int64(peopleOtherCountTextField.text ?? "0") ?? 0
            report.crmcRightOfWaySignApproved = approvalsCrmcROWSwitch.isOn
            report.coaAdoptionSignApproved = approvalsCoaAdoptionSignSwitch.isOn
            report.rowObstructionApproved = approvalsObstructionToROWSwitch.isOn
            report.rowPathwayEncroachmentApproved = approvalsEncroachmentToPathwaySwitch.isOn
            report.rowShorelineEncroachmentApproved = approvalsEncroachmentToShorelineSwitch.isOn
            report.pedestrianAccessApproved = approvalsWaterAccessSwitch.isOn
            report.parkingAccessApproved = approvalsParkingSwitch.isOn
            report.freeFromVandalismApproved = approvalsVandalismSwitch.isOn
            report.freeFromMarineDebrisAndLitterApproved = approvalsDebrisSwitch.isOn
            report.comments = commentsTextView.text
            
            self.report = report

            } else {
            // Throw error, return
        }
    }
}

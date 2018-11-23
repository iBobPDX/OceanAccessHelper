//
//  ReportDetailsTableViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit
import CoreData

class ReportDetailsTableViewController: BlurTableViewController, ReportManagedContext {

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
    
    var managedObjectContext: NSManagedObjectContext? // ReportManagedContext
    var report: Report?
    var crmcCodes = CRMC.allCodes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If we have an existing report on load then update our view to reflect this report for editing
        if let report = report {
            updateViewForReport(report)
        }
        
        setupCrmcCodePicker()
    }
    
    func setupCrmcCodePicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        locationTextField.inputView = picker
        crmcCodes.insert(("", ""), at: 0) // Putting blank row in data set for picker user experience
    }
    
    
    func createReport(with context: NSManagedObjectContext) -> Report? {
        guard let reporter = reporterNameTextField.text, let location = locationTextField.text, let crmc = crmcCodeTextField.text else {
            print("Failed to create report") // FIXME: Let's add some reasonable error handling here
            return nil
        }
        
        // If we have a report to edit, set it here, else generate a new report
        let activeReport = report ?? Report(context: context)
        
        activeReport.dateTime = reportDateTimePicker.date
        activeReport.reporterName = reporter
        activeReport.locationName = location
        activeReport.crmcCode = crmc
        
        activeReport.peopleWalkersCount = Int64(peopleWalkersCountTextfield.text ?? "0") ?? 0
        activeReport.peopleFishermenCount = Int64(peopleFishermenCountTextField.text ?? "0") ?? 0
        activeReport.peopleSurfersCount = Int64(peopleSurfersCountTextField.text ?? "0") ?? 0
        activeReport.peopleOtherCount = Int64(peopleOtherCountTextField.text ?? "0") ?? 0
        
        activeReport.crmcRightOfWaySignApproved = approvalsCrmcROWSwitch.isOn
        activeReport.coaAdoptionSignApproved = approvalsCoaAdoptionSignSwitch.isOn
        activeReport.rowObstructionApproved = approvalsObstructionToROWSwitch.isOn
        activeReport.rowPathwayEncroachmentApproved = approvalsEncroachmentToPathwaySwitch.isOn
        activeReport.rowShorelineEncroachmentApproved = approvalsEncroachmentToShorelineSwitch.isOn
        activeReport.pedestrianAccessApproved = approvalsWaterAccessSwitch.isOn
        activeReport.parkingAccessApproved = approvalsParkingSwitch.isOn
        activeReport.freeFromVandalismApproved = approvalsVandalismSwitch.isOn
        activeReport.freeFromMarineDebrisAndLitterApproved = approvalsDebrisSwitch.isOn
        
        activeReport.comments = commentsTextView.text
        
        return activeReport
    }
    
    func updateViewForReport(_ report:Report) {
        if let date = report.dateTime {
            reportDateTimePicker.setDate(date, animated: false)
            reporterNameTextField.text = report.reporterName
            locationTextField.text = report.locationName
            crmcCodeTextField.text = report.crmcCode
            
            peopleWalkersCountTextfield.text = String(report.peopleWalkersCount)
            peopleFishermenCountTextField.text = String(report.peopleFishermenCount)
            peopleSurfersCountTextField.text = String(report.peopleSurfersCount)
            peopleOtherCountTextField.text = String(report.peopleOtherCount)
            
            approvalsCrmcROWSwitch.isOn = report.crmcRightOfWaySignApproved
            approvalsCoaAdoptionSignSwitch.isOn = report.coaAdoptionSignApproved
            approvalsObstructionToROWSwitch.isOn = report.rowObstructionApproved
            approvalsEncroachmentToPathwaySwitch.isOn = report.rowPathwayEncroachmentApproved
            approvalsEncroachmentToShorelineSwitch.isOn = report.rowShorelineEncroachmentApproved
            approvalsWaterAccessSwitch.isOn = report.pedestrianAccessApproved
            approvalsParkingSwitch.isOn = report.parkingAccessApproved
            approvalsVandalismSwitch.isOn = report.freeFromVandalismApproved
            approvalsDebrisSwitch.isOn = report.freeFromMarineDebrisAndLitterApproved
            
            commentsTextView.text = report.comments
        }
    }
    
    

    // MARK - IBActions
    @IBAction func cancelToOeanAccessHome(_ segue: UIStoryboardSegue) {
        close(true, nil)
    }
    
    @IBAction func saveReportDetails(_ segue: UIStoryboardSegue) {
        if let managedObjectContext = managedObjectContext {
            
            // update report
            report = createReport(with: managedObjectContext)
            
            // attempt to save context
            do {
                try managedObjectContext.save()
            } catch {
                print("Failed saving")
            }
            
            close(true, nil)
        }
    }
    
    // currently assumes modal presentation, might want to write UIViewController extension to determine if VC has been pushed or modally presented
    func close(_ animated: Bool, _ completion:(() -> Void)?) {
        if let nvc = navigationController {
            nvc.dismiss(animated: animated)
        } else {
            dismiss(animated: animated, completion: completion)
        }
    }
}

extension ReportDetailsTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return crmcCodes.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return crmcCodes[row].0
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationTextField.text = crmcCodes[row].0
        crmcCodeTextField.text = crmcCodes[row].1
    }
}

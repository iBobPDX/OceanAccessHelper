//
//  ReportDetailsTableViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit
import CoreData

class ReportDetailsTableViewController: UITableViewController, ReportManagedContextable {

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
    
    private var photos: [UIImage] = [UIImage(),UIImage(),UIImage(),UIImage(),UIImage(),UIImage(),UIImage(),]
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    
    var managedObjectContext: NSManagedObjectContext? // ReportManagedContext
    var report: Report?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosCollectionView.register(UINib(nibName:"PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"Photo Cell")

        
        // If we have an existing report on load then update our view to reflect this report for editing
        if let report = report {
            updateViewForReport(report)
        } else if let reporter = UserDefaults.standard.string(forKey: UserDefaults.Keys.DefaultReporter) {
            reporterNameTextField.text = reporter
        }
        
        setupCrmcCodePicker()
    }
    
    func setupCrmcCodePicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        locationTextField.inputView = picker
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
        
        // Let's go ahead an store this in user defaults for convenience
        UserDefaults.standard.set(reporter, forKey: UserDefaults.Keys.DefaultReporter)
        
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
    
    

    // MARK: - IBActions
    @IBAction func cancelToOeanAccessHome(_ segue: UIStoryboardSegue) {
        close(true)
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
            
            close(true)
        }
    }
    
    // currently assumes modal presentation, might want to write UIViewController extension to determine if VC has been pushed or modally presented
    func close(_ animated: Bool) {
        if let nvc = navigationController {
            nvc.dismiss(animated: animated)
        } else {
            dismiss(animated: animated, completion: nil)
        }
    }
}

// MARK: UITableViewDelegate
extension ReportDetailsTableViewController {
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        /* For now lets just display an alert with the approval instructions */
        if let cell = tableView.cellForRow(at: indexPath) as? DetailDisclosable, let message = cell.detailDisclosureMessage {
            let alertController = UIAlertController.init(title: "More Information", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}

extension ReportDetailsTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo Cell", for: indexPath)
        if let cell = cell as? PhotoCollectionViewCell {
            if photos.count > indexPath.row {
                cell.imageView.image = photos[indexPath.row]
                cell.backgroundColor = .red
            } else {
                cell.backgroundColor = .blue
            }
        }
        return cell
    }
    
}

extension ReportDetailsTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return Municipality.allCases.count
        } else {
            let selectedLocation = pickerView.selectedRow(inComponent: 0)
            return AccessPoint.accessPointsForMunicipalityIndex(selectedLocation).count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return Municipality.allCases[row].rawValue
        } else {
            let selectedLocation = pickerView.selectedRow(inComponent: 0)
            return AccessPoint.accessPointsForMunicipalityIndex(selectedLocation)[row].0
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            /* Reload location Access Points if location component changed */
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.reloadComponent(1)
        } else {
            let selectedLocation = pickerView.selectedRow(inComponent: 0)
            let codes = AccessPoint.accessPointsForMunicipalityIndex(selectedLocation)
            locationTextField.text = codes[row].0
            crmcCodeTextField.text = codes[row].1
        }
    }
}

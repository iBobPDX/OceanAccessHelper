//
//  ReportDetailsTableViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit
import CoreData

class ReportDetailsTableViewController: UITableViewController, ManagedContextable, ReportProtocol {
    
    @IBOutlet private weak var locationTextField: UITextField!
    @IBOutlet private weak var crmcCodeTextField: UITextField!
    @IBOutlet private weak var reporterNameTextField: UITextField!
    
    @IBOutlet private weak var reportDateTimePicker: UIDatePicker!
    
    @IBOutlet private weak var peopleWalkersCountTextfield: UITextField!
    @IBOutlet private weak var peopleFishermenCountTextField: UITextField!
    @IBOutlet private weak var peopleSurfersCountTextField: UITextField!
    @IBOutlet private weak var peopleOtherCountTextField: UITextField!
    
    @IBOutlet private weak var approvalsCrmcROWSwitch: UISwitch!
    @IBOutlet private weak var approvalsCoaAdoptionSignSwitch: UISwitch!
    @IBOutlet private weak var approvalsObstructionToROWSwitch: UISwitch!
    @IBOutlet private weak var approvalsEncroachmentToPathwaySwitch: UISwitch!
    @IBOutlet private weak var approvalsEncroachmentToShorelineSwitch: UISwitch!
    @IBOutlet private weak var approvalsWaterAccessSwitch: UISwitch!
    @IBOutlet private weak var approvalsParkingSwitch: UISwitch!
    @IBOutlet private weak var approvalsVandalismSwitch: UISwitch!
    @IBOutlet private weak var approvalsDebrisSwitch: UISwitch!
    
    @IBOutlet private weak var commentsTextView: UITextView!
    @IBOutlet private weak var photosCollectionView: UICollectionView!
    
    var managedObjectContext: NSManagedObjectContext!
    var report: Report!
    var photosDataSource: ReportPhotosDataSource?
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosCollectionView.register(PhotoCollectionViewCell.self)
        
        viewModel = DetailViewModel(report: report, context: managedObjectContext)
        
        photosDataSource = ReportPhotosDataSource(report: report, context: managedObjectContext)
        photosDataSource?.delegate = self
        
        setupCrmcCodePicker()
        updateView()
    }
    
    private func setupCrmcCodePicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        locationTextField.inputView = picker
    }
    
    
    private func createReport(with context: NSManagedObjectContext) -> Report? {
        guard let reporter = reporterNameTextField.text, let location = locationTextField.text, let crmc = crmcCodeTextField.text, let report = report else {
            NSLog("Failed to create report") // TODO: Add some reasonable error handling here
            return nil
        }
        
        let activeReport = report
        
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
    
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        
        reportDateTimePicker.setDate(viewModel.dateTime, animated: false)
        reporterNameTextField.text = viewModel.reporterName
        locationTextField.text = viewModel.locationName
        crmcCodeTextField.text = viewModel.crmcCode
        
        peopleWalkersCountTextfield.text = viewModel.walkersCount
        peopleFishermenCountTextField.text = viewModel.fishermenCount
        peopleSurfersCountTextField.text = viewModel.surfersCount
        peopleOtherCountTextField.text = viewModel.otherCount
        
        approvalsCrmcROWSwitch.isOn = viewModel.crmcRightOfWaySignApproved
        approvalsCoaAdoptionSignSwitch.isOn = viewModel.coaAdoptionSignApproved
        approvalsObstructionToROWSwitch.isOn = viewModel.rowObstructionApproved
        approvalsEncroachmentToPathwaySwitch.isOn = viewModel.rowPathwayEncroachmentApproved
        approvalsEncroachmentToShorelineSwitch.isOn = viewModel.rowShorelineEncroachmentApproved
        approvalsWaterAccessSwitch.isOn = viewModel.pedestrianAccessApproved
        approvalsParkingSwitch.isOn = viewModel.parkingAccessApproved
        approvalsVandalismSwitch.isOn = viewModel.freeFromVandalismApproved
        approvalsDebrisSwitch.isOn = viewModel.freeFromMarineDebrisAndLitterApproved
        
        commentsTextView.text = viewModel.comments
    }

    // MARK: IBActions
    @IBAction private func cancelToOeanAccessHome(_ segue: UIStoryboardSegue) {
        close(true)
    }
    
    @IBAction private func saveReportDetails(_ segue: UIStoryboardSegue) {
        if let managedObjectContext = managedObjectContext {
            
            // update report
            report = createReport(with: managedObjectContext)
            
            // attempt to save context
            do {
                try managedObjectContext.save()
            } catch let error {
                NSLog(error.localizedDescription) // TODO: Handle error
            }
            
            close(true)
        }
    }
    
    // TODO: currently assumes modal presentation, might want to write UIViewController extension to determine if VC has been pushed or modally presented
    private func close(_ animated: Bool) {
        if let nvc = navigationController {
            nvc.dismiss(animated: animated)
        } else {
            dismiss(animated: animated, completion: nil)
        }
    }
}

// MARK: ReportPhotosDataSourceDelegate
extension ReportDetailsTableViewController: ReportPhotosDataSourceDelegate {
    func didAdd(photo: Photo) {
        photosCollectionView.reloadData()
    }
    
    func didRemovePhoto() {
        photosCollectionView.reloadData()
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

// MARK: UIImagePickerController Delegate
extension ReportDetailsTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photosDataSource?.addImage(image)
            if picker.sourceType == .camera {
//                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil) // save image to library
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: Photos Collection View Delegation / Datasource
extension ReportDetailsTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = photosDataSource?.numberOfPhotos() ?? 0
        return count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        if let photosDataSource = photosDataSource {
            cell.imageView.image = nil // reset cell for reuse
            cell.backgroundColor = nil // reset cell for reuse
            
            if photosDataSource.numberOfPhotos() > indexPath.row {
                cell.imageView.image = photosDataSource.imageForItemAtIndexPath(indexPath)
            } else {
                cell.imageView.image = UIImage(named: Assets.CameraIcon)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == photosDataSource?.numberOfPhotos() {
            addImage()
        } else {
            deleteImageAtIndexPath(indexPath)
        }
        
    }
    
    private func deleteImageAtIndexPath(_ indexPath: IndexPath) {
        let deleteAlert = UIAlertController.init(title: nil, message: "Are you sure you want to remove this photo?", preferredStyle: .alert)
        let deleteAction = UIAlertAction.init(title: "Remove", style: .destructive) { [weak self] (action) in
            self?.photosDataSource?.remove(at: indexPath)
        }
        
        deleteAlert.addAction(deleteAction)
        deleteAlert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        present(deleteAlert, animated: true, completion: nil)
    }
    
    private func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.modalPresentationStyle = .fullScreen
        
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction.init(title: "Take a photo", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        let libraryAction = UIAlertAction.init(title: "Choose photo from library", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(libraryAction)
        actionSheet.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
}

// MARK: UIPickerView Delegate / DataSource
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

//
//  ViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class ReportArchiveTableViewController: UITableViewController, ManagedContextable {
    var managedObjectContext: NSManagedObjectContext!
    var selectedReport: Report?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Failed to fetch results")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // dig out the view controller we care about
        var destinationViewController: ReportDetailsTableViewController
        if let navigationController = segue.destination as? UINavigationController {
            destinationViewController = navigationController.visibleViewController as! ReportDetailsTableViewController // FIXME: Evaluate forced downcast here for a better approach
        } else {
            destinationViewController = segue.destination as! ReportDetailsTableViewController
        }
        
        // Configure View Controller
        destinationViewController.managedObjectContext = managedObjectContext
        destinationViewController.report = selectedReport
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            managedObjectContext.delete(fetchedResultsController.object(at: indexPath))
            try? managedObjectContext.save()
        }
    }
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Report> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Report> = Report.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: Report.SortDescriptors.DateTime, ascending: false)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    func presentMailControllerForReport(_ report: Report, completion: (() -> Void)? = nil) {
        guard MFMailComposeViewController.canSendMail() else {
            let alert = UIAlertController(title: "Configure Email", message: "You must have an email address configured in your device's mail application in order to export reports.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if let location = report.locationName {
            let mailController = MFMailComposeViewController.init()
            mailController.mailComposeDelegate = self
            mailController.setSubject("Access Report for \(location)")
            mailController.setMessageBody("Sent with the unofficial <a href=\"https://testflight.apple.com/join/ODW0zFwK\">COA Adopt-an-Access iOS App</a> (Beta).", isHTML: true)
            mailController.setToRecipients(["data@cleanoceanaccess.org"])
            
            // 1. Create a print formatter
            let html = EmailHTMLBody.htmlTableForReport(report)
            let fmt = UIMarkupTextPrintFormatter(markupText: html)
            
            // 2. Assign print formatter to UIPrintPageRenderer
            let render = UIPrintPageRenderer()
            render.addPrintFormatter(fmt, startingAtPageAt: 0)
            
            // 3. Assign paperRect and printableRect
            let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
            render.setValue(page, forKey: "paperRect")
            render.setValue(page, forKey: "printableRect")
            
            // 4. Create PDF context and draw
            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
            
            for i in 0..<render.numberOfPages {
                UIGraphicsBeginPDFPage();
                render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
            }
            
            UIGraphicsEndPDFContext();
            
            // 5. Save PDF file
            mailController.addAttachmentData(pdfData as Data, mimeType: "application/pdf", fileName: "report.pdf")
            
            for (i,photo) in (report.photos ?? []).enumerated() {
                if let photo = photo as? Photo, let data = photo.imageData {
                    mailController.addAttachmentData(data, mimeType: "image/jpeg", fileName: "\(report.locationName ?? "")-\(i+1).jpg")
                }
            }   
            
            self.present(mailController, animated: true, completion: completion)
        }
        
    }
    

}

// MARK: - UITableViewDelegate
extension ReportArchiveTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedReport = fetchedResultsController.object(at: indexPath)
        performSegue(withIdentifier: "editReportSegue", sender: self)
    }
}

// MARK: - UITableViewDataSource
extension ReportArchiveTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let reports = fetchedResultsController.fetchedObjects else {
            return 0
            
        }
        
        return reports.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.ArchiveCell, for: indexPath)
        configure(cell, at: indexPath)
        
        return cell
    }
    
    func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
        let report = fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = report.locationName
        cell.detailTextLabel?.text = report.formattedDateTime
        cell.accessoryType = report.submitted ? .checkmark : .none
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction.init(style: .normal, title: ActionTitles.Export) { [weak self] (action, view, completion) in
            let report = self?.fetchedResultsController.object(at: indexPath)
            if let report = report {
                self?.presentMailControllerForReport(report) { [weak self] in
                    self?.selectedReport = report
                    self?.tableView.setEditing(false, animated: true)
                }
            }
        }
        action.backgroundColor = UIColor.init(red: 69.0/255.0, green: 105.0/255.0, blue: 154.0/255.0, alpha: 1.0)
        
        
        let config = UISwipeActionsConfiguration.init(actions:[action])
        
        return config
    }
}

extension ReportArchiveTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
            case .insert:
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break;
            case .delete:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                break;
            case .update:
                if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath) {
                    configure(cell, at: indexPath)
                }
                break;
            case .move:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                
                if let newIndexPath = newIndexPath {
                    tableView.insertRows(at: [newIndexPath], with: .fade)
                }
                break;
        }
    }
}

extension ReportArchiveTableViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let error = error {
            print("Error: \(error.localizedDescription)")
        } else if result == .sent {
            self.selectedReport?.submitted = true
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ReportArchiveTableViewController {
    enum CellIdentifiers {
        static let ArchiveCell = "ArchiveCell"
    }
    enum ActionTitles {
        static let Export = "Export"
    }
}


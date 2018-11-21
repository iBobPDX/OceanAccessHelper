//
//  ViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit
import CoreData

class ReportArchiveTableViewController: UITableViewController, ArchiveManagedContext {
    var managedObjectContext: NSManagedObjectContext?
    var selectedReport: Archive?
    
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
            destinationViewController = navigationController.visibleViewController as! ReportDetailsTableViewController // FIXME: Evaluate force downcast here for a better approach
        } else {
            destinationViewController = segue.destination as! ReportDetailsTableViewController
        }
        
        // Configure View Controller
        destinationViewController.managedObjectContext = managedObjectContext
        destinationViewController.report = selectedReport
    }
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Archive> = {
        guard let managedObjectContext = managedObjectContext else {
            fatalError("Invalid managed object context")
        }
        
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Archive> = Archive.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateTime", ascending: true)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()

}

// MARK - UITableViewDelegate
extension ReportArchiveTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedReport = fetchedResultsController.object(at: indexPath)
        performSegue(withIdentifier: "editReportSegue", sender: self)
    }
}

// MARK - UITableViewDataSource
extension ReportArchiveTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let archives = fetchedResultsController.fetchedObjects else { return 0 }
        return archives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveCell", for: indexPath)
        let archive = fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = archive.locationName
        cell.detailTextLabel?.text = archive.dateTime?.description
        
        return cell
    }
}

extension ReportArchiveTableViewController: NSFetchedResultsControllerDelegate {
    
}


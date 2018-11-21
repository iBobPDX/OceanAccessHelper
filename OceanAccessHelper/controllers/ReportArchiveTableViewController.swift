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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("Issues")
        }
    }
    
    private func setupView() {
        
    }
    
    private func updateView() {
        
    }
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Archive> = {
        guard let managedObjectContext = self.managedObjectContext else {
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

extension ReportArchiveTableViewController: NSFetchedResultsControllerDelegate {}


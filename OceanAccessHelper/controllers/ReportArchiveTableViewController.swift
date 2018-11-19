//
//  ViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit

class ReportArchiveTableViewController: UITableViewController {
    var archives = SampleData.generateArchiveData() // FIXME: Pull data from disc via CoreData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

// MARK - UITableViewDataSource
extension ReportArchiveTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return archives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArchiveCell", for: indexPath)
        let archive = archives[indexPath.row]
        
        cell.textLabel?.text = archive.locationName
        cell.detailTextLabel?.text = archive.dateTime?.description
        
        return cell
    }
}


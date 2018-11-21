//
//  OceanAccessHomeViewController.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import UIKit
import CoreData

class OceanAccessHomeViewController: UIViewController {
    private let persistentContainer = NSPersistentContainer(name: "OceanAccessHelper")

    override func viewDidLoad() {
        super.viewDidLoad()

        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                print("Unable to Load Persistent Store")
                print("\(error), \(error.localizedDescription)")
                
            } else {
                //continue
            }
        }
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // dig out the view controller we care about
        var destinationViewController: ArchiveManagedContext
        if let navigationController = segue.destination as? UINavigationController {
            destinationViewController = navigationController.visibleViewController as! ArchiveManagedContext // FIXME: Evaluate force downcast here for a better approach
        } else {
            destinationViewController = segue.destination as! ArchiveManagedContext
        }
        
        // Configure View Controller
        destinationViewController.managedObjectContext = persistentContainer.viewContext
    }
 
    

}

protocol ArchiveManagedContext {
    var managedObjectContext: NSManagedObjectContext? { get set }
}

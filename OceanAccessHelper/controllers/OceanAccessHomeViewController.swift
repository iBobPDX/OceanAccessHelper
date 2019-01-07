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
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var newReportButton: UIButton!
    
    @IBOutlet weak var reportArchiveButton: UIButton!
    
    
    var persistentContainer: NSPersistentContainer = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let image = UIImage(named: Assets.OceanBackground) {
            self.backgroundImageView.image = image
            self.backgroundImageView.contentMode = .scaleAspectFill
        }
    }
    
    func configureButtons() {
        let radius = CGFloat(10.0)
        
        newReportButton.layer.cornerRadius = radius
        reportArchiveButton.layer.cornerRadius = radius
        
        newReportButton?.addBlur(at: 0, style: .regular)
        reportArchiveButton?.addBlur(at: 0, style: .regular)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController: ManagedContextable
        
        if let navigationController = segue.destination as? UINavigationController, let visibleViewController = navigationController.viewControllers.first as? ManagedContextable {
            destinationViewController = visibleViewController
            destinationViewController.managedObjectContext = persistentContainer.viewContext
        } else if let destination = segue.destination as? ManagedContextable {
            destinationViewController = destination
            destinationViewController.managedObjectContext = persistentContainer.viewContext
        }
    }
 
    

}

// MARK: - ManagedContextable
// TODO: Move to its own file
protocol ManagedContextable {
    var managedObjectContext: NSManagedObjectContext? { get set }
}

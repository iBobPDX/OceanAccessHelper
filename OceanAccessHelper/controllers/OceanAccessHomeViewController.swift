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
    
    
    private let persistentContainer = NSPersistentContainer(name: "OceanAccessHelper")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup CoreData stack
        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                print("Unable to Load Persistent Store")
                print("\(error), \(error.localizedDescription)")
                
            } else {
                //continue
            }
        }
        
        configureButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let image = UIImage(named: "coa-background") {
            self.backgroundImageView.image = image
            self.backgroundImageView.contentMode = .scaleAspectFill
//            addParallaxToView(self.backgroundImageView)
        }
        
//        animateButtonIntroduction() // Might play with animating these guys in?
    }
    
    func configureButtons() {
        let radius = CGFloat(10.0)
        
        newReportButton.layer.cornerRadius = radius
        reportArchiveButton.layer.cornerRadius = radius
        
        newReportButton?.addBlur(at: 0, style: .regular)
        reportArchiveButton?.addBlur(at: 0, style: .regular)
    }
    
    func animateButtonIntroduction() {
        UIView.animate(withDuration: 2.0, delay: 1.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
        }, completion: nil)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // dig out the view controller we care about
        var destinationViewController: ReportManagedContext
        if let navigationController = segue.destination as? UINavigationController {
            destinationViewController = navigationController.visibleViewController as! ReportManagedContext // FIXME: Evaluate force downcast here for a better approach
        } else {
            destinationViewController = segue.destination as! ReportManagedContext
        }
        
        // Configure View Controller
        destinationViewController.managedObjectContext = persistentContainer.viewContext
    }
 
    

}

// MARK: - ReportManagedContext
protocol ReportManagedContext {
    var managedObjectContext: NSManagedObjectContext? { get set }
}

// MARK: - Parallax
func addParallaxToView(_ view: UIView) {
    let amount = 100
    
    let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
    horizontal.minimumRelativeValue = -amount
    horizontal.maximumRelativeValue = amount
    
    let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
    vertical.minimumRelativeValue = -amount
    vertical.maximumRelativeValue = amount
    
    let group = UIMotionEffectGroup()
    group.motionEffects = [horizontal, vertical]
    view.addMotionEffect(group)
}

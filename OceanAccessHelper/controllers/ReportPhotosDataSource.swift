//
//  ReportPhotosDataSource.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 1/7/19.
//  Copyright © 2019 Robert Corlett. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ReportPhotosDataSourceDelegate: class {
    func didAdd(photo: Photo)
    func didRemovePhoto()
}

class ReportPhotosDataSource  {
    let managedObjectContext: NSManagedObjectContext
    
    var photos: [Photo] = []
    var report: Report
    
    weak var delegate: ReportPhotosDataSourceDelegate?
    
    
    init(report: Report, context: NSManagedObjectContext) {
        self.managedObjectContext = context
        self.report = report
        
        if let photos = report.photos as? Set<Photo> {
            self.photos = Array(photos)
        }
    }
    
    func numberOfPhotos() -> Int {
        return photos.count
    }
    
    func addImage(_ image: UIImage) {
        let photo = Photo(context: managedObjectContext)
        photo.createdAt = Date()
        
        let uuid = UUID()
        photo.uuid = uuid
        photo.imageData = image.jpegData(compressionQuality: 1.0)
        
        photos.append(photo)
        report.addToPhotos(photo)
        delegate?.didAdd(photo:photo)
    }
    
    func remove(at indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        managedObjectContext.delete(photo)
        photos.remove(at: indexPath.row)
        delegate?.didRemovePhoto()
    }
    
    func imageForItemAtIndexPath(_ indexPath: IndexPath) -> UIImage? {
        guard let data = photos[indexPath.row].imageData else {
            return nil
        }
        
        return UIImage(data: data)
    }
}

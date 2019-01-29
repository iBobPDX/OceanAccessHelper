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
        
        let fileManager = FileManager.default
        let photosDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("photos") // TODO: Handle error
        
        if let directory = photosDirectory?.relativePath, !fileManager.fileExists(atPath: directory) {
            do {
                try fileManager.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                NSLog(error.localizedDescription)
            }
        }
        
        if let path = photosDirectory?.appendingPathComponent(uuid.uuidString) {
            let data = image.jpegData(compressionQuality: 1.0)
            try? data?.write(to: path) // TODO: Handle error
            
            photo.filePath = path.relativePath
            photos.append(photo)
            report.addToPhotos(photo)
            delegate?.didAdd(photo:photo)
        }
    }
    
    func remove(at indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        if let path = photo.filePath {
            try? FileManager.default.removeItem(atPath: path) // TODO: Handle error
        }
        
        managedObjectContext.delete(photo)
        photos.remove(at: indexPath.row)
        delegate?.didRemovePhoto()
    }
    
    func imageForItemAtIndexPath(_ indexPath: IndexPath) -> UIImage? {
        guard let path = photos[indexPath.row].filePath, let data = FileManager.default.contents(atPath: path) else {
            return nil
        }
        
        return UIImage(data: data)
    }
}

//
//  Photo.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 1/5/19.
//  Copyright © 2019 Robert Corlett. All rights reserved.
//

import Foundation
import UIKit

extension Photo {
    func saveImage(_ image: UIImage) -> Bool {
        guard let path = filePath else {
            return false
        }
        
        let data = image.jpegData(compressionQuality: 1.0)
        let fileManager = FileManager.default
        
        return fileManager.createFile(atPath: path, contents: data, attributes: nil)
    }
    
    func getSavedImage() -> UIImage? {
        guard let path = filePath else {
            return nil
        }
        
        return UIImage.init(contentsOfFile: path)
    }
}

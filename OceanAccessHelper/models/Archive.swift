//
//  Archive.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import Foundation
import CoreData

extension Archive {
    
    var formattedDateTime: String? {
        var formattedDate: String? = nil
        if let date = self.dateTime {
            let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("MMM d, h:mm a")
            formattedDate = dateFormatter.string(from: date)
        }
        
        return formattedDate
    }
}

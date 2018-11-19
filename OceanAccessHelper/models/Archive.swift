//
//  Archive.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import Foundation

struct Archive {
    var dateTime : Date?
    var reporterName : String?
    
    var locationName : String? // should this be derived from crmcCode enum?
    var crmcCode : String? // should this be an enum of all codes?
    
    var people : PeopleObservation?
    
    // Approvals
    var crmcRightOfWaySignApproved : Bool
    var coaAdoptionSignApproved : Bool
    var rowObstructionApproved: Bool
    var rowEncroachmentApproved: Bool
    var pedestrianAccessApproved: Bool
    var parkingAccessApproved: Bool
    var freeFromVandalismApproved: Bool
    var freeFromMarineDebrisAndLitterApproved: Bool
    
    var comments: String?
}

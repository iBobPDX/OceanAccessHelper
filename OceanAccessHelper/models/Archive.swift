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
    
    var peopleWalkersCount : Int?
    var peopleFishermenCount: Int?
    var peopleSurfersCount: Int?
    var peopleOtherCount: Int?
    
    // Approvals
    var crmcRightOfWaySignApproved : Bool
    var coaAdoptionSignApproved : Bool
    var rowObstructionApproved: Bool
    var rowPathwayEncroachmentApproved: Bool
    var rowShorelineEncroachmentApproved: Bool
    var pedestrianAccessApproved: Bool
    var parkingAccessApproved: Bool
    var freeFromVandalismApproved: Bool
    var freeFromMarineDebrisAndLitterApproved: Bool
    
    var comments: String?
}

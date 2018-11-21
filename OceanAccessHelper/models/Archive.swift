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
    var otherCountString: String {
        get {
            return "We counted \(peopleOtherCount) other people"
        }
    }
}

//class Archive : NSManagedObject  {
//    @NSManaged var dateTime: Date?
//    @NSManaged var reporterName: String?
//
//    @NSManaged var locationName: String? // should this be derived from crmcCode enum?
//    @NSManaged var crmcCode: String? // should this be an enum of all codes?
//
//    @NSManaged var peopleWalkersCount: Int
//    @NSManaged var peopleFishermenCount: Int
//    @NSManaged var peopleSurfersCount: Int
//    @NSManaged var peopleOtherCount: Int
//
//    // Approvals
//    @NSManaged var crmcRightOfWaySignApproved: Bool
//    @NSManaged var coaAdoptionSignApproved: Bool
//    @NSManaged var rowObstructionApproved: Bool
//    @NSManaged var rowPathwayEncroachmentApproved: Bool
//    @NSManaged var rowShorelineEncroachmentApproved: Bool
//    @NSManaged var pedestrianAccessApproved: Bool
//    @NSManaged var parkingAccessApproved: Bool
//    @NSManaged var freeFromVandalismApproved: Bool
//    @NSManaged var freeFromMarineDebrisAndLitterApproved: Bool
//
//    @NSManaged var comments: String?
//}

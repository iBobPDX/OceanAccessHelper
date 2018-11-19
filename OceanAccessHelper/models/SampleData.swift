//
//  SampleData.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import Foundation

final class SampleData {
    static func generateArchiveData() -> [Archive] {
        return [
            Archive(dateTime:Date(),
                    reporterName:"Robert Corlett",
                    locationName: "Pine Street",
                    crmcCode:"Z-09",
                    people:PeopleObservation.none,
                    crmcRightOfWaySignApproved: true,
                    coaAdoptionSignApproved: true,
                    rowObstructionApproved: true,
                    rowPathwayEncroachmentApproved: true,
                    rowShorelineEncroachmentApproved: true,
                    pedestrianAccessApproved: true,
                    parkingAccessApproved: true,
                    freeFromVandalismApproved: true,
                    freeFromMarineDebrisAndLitterApproved: true,
                    comments: nil
                    ),
            Archive(dateTime:Date(),
                    reporterName:"Robert Corlett",
                    locationName: "Cherry Street",
                    crmcCode:"Z-10",
                    people:PeopleObservation.none,
                    crmcRightOfWaySignApproved: true,
                    coaAdoptionSignApproved: true,
                    rowObstructionApproved: true,
                    rowPathwayEncroachmentApproved: true,
                    rowShorelineEncroachmentApproved: true,
                    pedestrianAccessApproved: true,
                    parkingAccessApproved: true,
                    freeFromVandalismApproved: true,
                    freeFromMarineDebrisAndLitterApproved: true,
                    comments: nil
            )
        ]
    }
}

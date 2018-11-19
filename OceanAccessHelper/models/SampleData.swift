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
                    peopleWalkersCount: 0,
                    peopleFishermenCount: 1,
                    peopleSurfersCount: 0,
                    peopleOtherCount: 0,
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
                    peopleWalkersCount: nil,
                    peopleFishermenCount: nil,
                    peopleSurfersCount: nil,
                    peopleOtherCount: nil,
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

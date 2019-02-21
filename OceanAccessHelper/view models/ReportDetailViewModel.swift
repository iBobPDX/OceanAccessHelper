//
//  ReportDetailViewModel.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 2/1/19.
//  Copyright © 2019 Robert Corlett. All rights reserved.
//

import Foundation
import CoreData
import UIKit


protocol ReportIdentifiable {
    var reporterName: String { get }
    var locationName: String { get }
    var dateTime: Date { get }
    var crmcCode: String { get }
}

protocol PeopleSurveyable {
    var walkersCount: String { get }
    var fishermenCount: String { get }
    var surfersCount: String { get }
    var otherCount: String { get }
}

protocol Approvable {
    var crmcRightOfWaySignApproved: Bool { get }
    var coaAdoptionSignApproved: Bool { get }
    var rowObstructionApproved: Bool { get }
    var rowPathwayEncroachmentApproved: Bool { get }
    var rowShorelineEncroachmentApproved: Bool { get }
    var pedestrianAccessApproved: Bool { get }
    var parkingAccessApproved: Bool { get }
    var freeFromVandalismApproved: Bool { get }
    var freeFromMarineDebrisAndLitterApproved: Bool { get }
}

protocol Commentable {
    var comments: String { get }
}

class DetailViewModel: ReportIdentifiable, PeopleSurveyable, Approvable, Commentable {
    private var report: Report
    private var context: NSManagedObjectContext
    
    required init(report: Report, context: NSManagedObjectContext) {
        self.report = report
        self.context = context
    }
    
    var reporterName: String {
        get {
            return report.reporterName ?? UserDefaults.standard.string(forKey: UserDefaults.Keys.DefaultReporter) ?? ""
        }
    }
    
    var locationName: String {
        get {
            return report.locationName ?? ""
        }
    }
    
    var dateTime: Date {
        get {
            return report.dateTime ?? Date()
        }
    }
    
    var crmcCode: String {
        get {
            return report.crmcCode ?? ""
        }
    }
    
    var walkersCount: String {
        get {
            return String(report.peopleWalkersCount)
        }
    }
    
    var fishermenCount: String {
        get {
            return String(report.peopleFishermenCount)
        }
    }
    
    var surfersCount: String {
        get {
            return String(report.peopleSurfersCount)
        }
    }
    
    var otherCount: String {
        get {
            return String(report.peopleOtherCount)
        }
    }
    
    var crmcRightOfWaySignApproved: Bool {
        get {
            return report.crmcRightOfWaySignApproved
        }
    }
    
    var coaAdoptionSignApproved: Bool {
        get {
            return report.coaAdoptionSignApproved
        }
    }
    
    var rowObstructionApproved: Bool {
        get {
            return report.rowObstructionApproved
        }
    }
    
    var rowPathwayEncroachmentApproved: Bool {
        get {
            return report.rowPathwayEncroachmentApproved
        }
    }
    
    var rowShorelineEncroachmentApproved: Bool {
        get {
            return report.rowShorelineEncroachmentApproved
        }
    }
    
    var pedestrianAccessApproved: Bool {
        get {
            return report.pedestrianAccessApproved
        }
    }
    
    var parkingAccessApproved: Bool {
        get {
            return report.parkingAccessApproved
        }
    }
    
    var freeFromVandalismApproved: Bool {
        get {
            return report.freeFromVandalismApproved
        }
    }
    
    var freeFromMarineDebrisAndLitterApproved: Bool {
        get {
            return report.freeFromMarineDebrisAndLitterApproved
        }
    }
    
    var comments: String {
        get {
            return report.comments ?? ""
        }
    }

}


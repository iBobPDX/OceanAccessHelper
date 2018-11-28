//
//  EmailHTMLBody.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/28/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import Foundation
import UIKit

class EmailHTMLBody {
    static func dateForReport(_ report: Report) -> String {
        guard let date = report.dateTime else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MM/dd")
        return dateFormatter.string(from: date)
    }
    
    static func timeForReport(_ report: Report) -> String {
        guard let date = report.dateTime else {
            return ""
        }
        
        let timeFormatter = DateFormatter()
        timeFormatter.setLocalizedDateFormatFromTemplate("h:mm a")
        return timeFormatter.string(from: date)
    }
    
    static func htmlTableForReport(_ report: Report) -> String {
        let htmlTable =
        """
        <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
        .tg .tg-llyw{background-color:#efefef;border-color:inherit;text-align:left;vertical-align:top}
        .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
        .tg .tg-fymr{font-weight:bold;border-color:inherit;text-align:left;vertical-align:top}
        </style>
        <table class="tg">
        <tr>
        <th class="tg-llyw">Location</th>
        <th class="tg-llyw">CRMC Code</th>
        <th class="tg-llyw">Date</th>
        <th class="tg-llyw">Time</th>
        <th class="tg-llyw">Reporter</th>
        </tr>
        <tr>
        <td class="tg-0pky">\(report.locationName ?? "")</td>
        <td class="tg-0pky">\(report.crmcCode ?? "")</td>
        <td class="tg-0pky">\(self.dateForReport(report))</td>
        <td class="tg-0pky">\(self.timeForReport(report))</td>
        <td class="tg-0pky">\(report.reporterName ?? "")</td>
        </tr>
        <tr>
        <td class="tg-0pky" colspan="5"></td>
        </tr>
        <tr>
        <td class="tg-fymr" colspan="5">People</td>
        </tr>
        <tr>
        <td class="tg-llyw">Walkers</td>
        <td class="tg-llyw">Fishermen</td>
        <td class="tg-llyw">Surfers</td>
        <td class="tg-llyw">Other</td>
        <td class="tg-llyw"></td>
        </tr>
        <tr>
        <td class="tg-0pky">\(report.peopleWalkersCount)</td>
        <td class="tg-0pky">\(report.peopleFishermenCount)</td>
        <td class="tg-0pky">\(report.peopleSurfersCount)</td>
        <td class="tg-0pky">\(report.peopleOtherCount)</td>
        <td class="tg-0pky"></td>
        </tr>
        <tr>
        <td class="tg-0pky" colspan="5"></td>
        </tr>
        <tr>
        <td class="tg-fymr" colspan="5">Access Parameters</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">CRMC Right-of-Way</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.crmcRightOfWaySignApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">COA Adoption Sign</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.coaAdoptionSignApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">No Obstruction to ROW</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.rowObstructionApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">No Encroachment to Pathway</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.rowPathwayEncroachmentApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">No Encroachment to Shoreline</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.rowShorelineEncroachmentApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">Able to Access Water</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.pedestrianAccessApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">Parking Available</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.parkingAccessApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">Free from Vandalism</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.freeFromVandalismApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-llyw" colspan="2">Free from Marine Debris and Litter</td>
        <td class="tg-0pky"></td>
        <td class="tg-0pky" colspan="2">\(report.freeFromMarineDebrisAndLitterApproved ? "YES" : "NO")</td>
        </tr>
        <tr>
        <td class="tg-0pky" colspan="5"></td>
        </tr>
        <tr>
        <td class="tg-fymr" colspan="5">Comments</td>
        </tr>
        <tr>
        <td class="tg-0pky" colspan="5">\(report.comments ?? "")</td>
        </tr>
        </table>
        """
        
        return htmlTable
    }
}

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
    static func htmlTableForReport(_ report: Report) -> String {
        let htmlTable =
        """
        <html>
            <style type="text/css">
                .ti {text-align: center;}
                .tg {width: 100%;}
                .tg {white-space: pre-line;}
                .tg  {border-collapse:collapse;border-spacing:0;}
                .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
                .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
                .tg .tg-llyw{background-color:#efefef;border-color:inherit;text-align:left;vertical-align:top}
                .tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
                .tg .tg-fymr{font-weight:bold;border-color:inherit;text-align:left;vertical-align:top}
            </style>
            <head>
                <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                <meta http-equiv="Content-Type" content="text/html charset=UTF-8">
            </head>
            <body>
                <header class="ti">
                    <h1>CRMC</h1>
                    <h3>Adopt-an-Access Program</h3>
                </header>
                <table class="tg" style="border-collapse: collapse;border-spacing: 0;">
                    <tr>
                        <th class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;font-weight: normal;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Location</th>
                        <th class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;font-weight: normal;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">CRMC Code</th>
                        <th class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;font-weight: normal;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Date and Time</th>
                        <th class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;font-weight: normal;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Reporter</th>
                    </tr>
                    <tr>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.locationName ?? "")</td>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.crmcCode ?? "")</td>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.formattedDateTime ?? "")</td>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.reporterName ?? "")</td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="4" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;"></td>
                    </tr>
                    <tr>
                        <td class="tg-fymr" colspan="4" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;font-weight: bold;text-align: left;vertical-align: top;">People</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Walkers</td>
                        <td class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Fishermen</td>
                        <td class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Surfers</td>
                        <td class="tg-llyw" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Other</td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.peopleWalkersCount)</td>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.peopleFishermenCount)</td>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.peopleSurfersCount)</td>
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.peopleOtherCount)</td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="4" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;"></td>
                    </tr>
                    <tr>
                        <td class="tg-fymr" colspan="4" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;font-weight: bold;text-align: left;vertical-align: top;">Access Parameters</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">CRMC Right-of-Way</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.crmcRightOfWaySignApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">COA Adoption Sign</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.coaAdoptionSignApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">No Obstruction to ROW</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.rowObstructionApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">No Encroachment to Pathway</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.rowPathwayEncroachmentApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">No Encroachment to Shoreline</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.rowShorelineEncroachmentApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Able to Access Water</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.pedestrianAccessApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Parking Available</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.parkingAccessApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Free from Vandalism</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.freeFromVandalismApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-llyw" colspan="3" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;background-color: #efefef;text-align: left;vertical-align: top;">Free from Marine Debris and Litter</td>
        
                        <td class="tg-0pky" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.freeFromMarineDebrisAndLitterApproved ? "Approved" : "Issue Noted")</td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="4" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;"></td>
                    </tr>
                    <tr>
                        <td class="tg-fymr" colspan="4" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;font-weight: bold;text-align: left;vertical-align: top;">Comments</td>
                    </tr>
                    <tr>
                        <td class="tg-0pky" colspan="4" style="font-family: Arial, sans-serif;font-size: 14px;padding: 10px 5px;border-style: solid;border-width: 1px;overflow: hidden;word-break: normal;border-color: inherit;text-align: left;vertical-align: top;">\(report.comments ?? "")</td>
                    </tr>
                </table>
            </body>
        </html>
        """
        
        return htmlTable
    }
}

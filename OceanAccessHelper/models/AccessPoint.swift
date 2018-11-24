//
//  AccessPoint.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/21/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import Foundation

enum Municipality: String, CaseIterable {
    case barrington = "Barrington"
    case bristol = "Bristol"
    case charlestown = "Charlestown"
    case cranston = "Cranston"
    case eastGreenwich = "East Greenwich"
    case eastProvidence = "East Providence"
    case jamestown = "Jamestown"
    case littleCompton = "Little Compton"
    case middletown = "Middletown"
    case narragansett = "Narragansett"
    case newShoreham = "New Shoreham"
    case newport = "Newport"
    case northKingstown = "North Kingstown"
    case pawtucket = "Pawtucket"
    case portsmouth = "Portsmouth"
    case providence = "Providence"
    case southKingstown = "South Kingstown"
    case tiverton = "Tiverton"
    case warren = "Warren"
    case warwick = "Warwick"
    case westerly = "Westerly"
    
}

struct AccessPoint {
    static func accessPointsForMunicipality(_ municipality: Municipality) -> [(String, String)] {
        switch municipality {
        case .barrington:
            return [
                ("Nayatt/ Daunis Road", "P-2"),
                ("Shore Road", "P-1")
            ]
        case .bristol:
            return [
                ("Annawamscutt Drive", "S-17"),
                ("Azalea Drive", "S-9"),
                ("Bayview (Clipper Way)", "S-25"),
                ("Beach Road", "S-1"),
                ("Burton Street", "S-23"),
                ("Butterworth Avenue", "S-8"),
                ("Constitution Street", "S-4"),
                ("Fales Road", "S-3"),
                ("Fatima Drive", "S-10"),
                ("Franklin Street", "S-21"),
                ("Gibson Road", "S-2"),
                ("Kickemuit Avenue", "S-14"),
                ("King Phillip Avenue", "S-28"),
                ("Low Lane", "S-18"),
                ("Narrows Peninsula", "S-26"),
                ("Narrows Road", "S-15"),
                ("North Street", "S-7"),
                ("Oliver Street", "S-22"),
                ("Peck Avenue", "S-24"),
                ("Platt Street (Narrows Coastal Access)", "S-27"),
                ("Poppasquash Road (beach lot)", "S-19"),
                ("San Miguel Drive", "S-11"),
                ("Sherman Avenue", "S-12"),
                ("Smith Avenue", "S-13"),
                ("State Street", "S-20"),
                ("Sunrise Drive", "S-16"),
                ("Union Street", "S-5"),
                ("Walley Street", "S-6")
            ]
        case .charlestown:
            return [
                ("Charlestown Breachway & Boat Ramp", "B-1"),
                ("East Beach Road", "B-2")
            ]
        case .cranston:
            return [
                ("Aborn Street (south side)", "K-1"),
                ("Aborn Street (westerly side)", "K-2"),
                ("Seaview Avenue", "K-3")
            ]
        case .eastGreenwich:
            return [
                ("Bridge Street", "H-5"),
                ("Division Street", "H-6"),
                ("King Street", "H-4"),
                ("London Street", "H-1"),
                ("Long Steet", "H-3"),
                ("Rocky Hollow Road", "H-2")
            ]
        case .eastProvidence:
            return [
                ("Eighth Beachway", "N-9"),
                ("Eleventh Beachway", "N-12"),
                ("Fifth Beachway", "N-6"),
                ("First Beachway", "N-2"),
                ("Fourth Beachway", "N-5"),
                ("Narragansett Beachway", "N-1"),
                ("Ninth Beachway", "N-10"),
                ("Riverside Drive", "N-13"),
                ("Second Beachway", "N-3"),
                ("Seventh Beachway", "N-8"),
                ("Sixth Beachway", "N-7"),
                ("Tenth Beachway", "N-11"),
                ("Third Beachway", "N-4")
            ]
        case .jamestown:
            return [
                ("Broad Street", "G-1"),
                ("Bucaneer Way", "G-9"),
                ("Capstan Street", "G-12"),
                ("Carr Lane", "G-10"),
                ("Champlin Way", "G-8"),
                ("Decatur Avenue", "G-13"),
                ("Eldred Avenue", "G-5"),
                ("Garboard Street", "G-11"),
                ("Hull Street", "G-7"),
                ("Mast Street", "G-6"),
                ("Spindrift Street", "G-4"),
                ("Spirketing Street", "G-2"),
                ("Steamboat Street", "G-3")
            ]
        case .littleCompton:
            return [
                ("Sakonnet Harbor-Boat Ramp", "W-3"),
                ("Taylor's Lane", "W-1"),
                ("Town Way Road", "W-2")
            ]
        case .middletown:
            return [
                ("Kingfisher Avenue", "Y-7"),
                ("NW end of Esplanade Drive", "Y-8"),
                ("Shore Drive", "Y-3"),
                ("Shore Drive, opp Lot 107", "Y-10"),
                ("Southeast end of Esplanade & Shore Drive", "Y-5"),
                ("Taggart's Ferry Road", "Y-6"),
                ("Third Beach Road", "Y-4"),
                ("Tuckerman Avenue (opposite Wolcott Avenue)", "Y-11"),
                ("Tuckerman Avenue, btwn Lots 104/105", "Y-1"),
                ("Western end of Purgatory Road", "Y-9")
            ]
        case .narragansett:
            return [
                ("Bass Rock Road", "C-6"),
                ("Black Point", "C-5"),
                ("Calef Avenue", "C-3"),
                ("Conanicus Road", "C-11"),
                ("Conant Avenue Road End", "C-7"),
                ("Foddering Farm Road Extension", "C-12"),
                ("Hazard Avenue", "C-9"),
                ("Knowlesway Extension", "C-1"),
                ("Newton Avenue", "C-13"),
                ("Pettaquamscutt Avenue", "C-10"),
                ("Pilgrim Avenue", "C-2"),
                ("South Ferry Road", "C-8"),
                ("Wandsworth Street Extension", "C-14")
            ]
        case .newShoreham:
            return [
                ("Andy's Way", "E-6"),
                ("Coast Guard Station/ Coast Guard Road", "E-5"),
                ("Scotch Beach Road", "E-2"),
                ("Scup Rock property", "E-3"),
                ("Settlers Rock", "E-1"),
                ("Southwest Point/ Conneymus Road", "E-4"),
                ("West Beach Road", "E-7")
            ]
        case .newport:
            return [
                ("Battery Street", "Z-8"),
                ("Brown & Howard Wharf", "Z-18"),
                ("Cherry Street", "Z-10"),
                ("Chestnut Street", "Z-11"),
                ("Cypress Street", "Z-6"),
                ("Elm Street", "Z-15"),
                ("Goat Island Connector 1", "Z-17"),
                ("Goat Island Connector 2", "Z-16"),
                ("Howard Wharf", "Z-20"),
                ("Ledge Road", "Z-3"),
                ("Lee's Wharf", "Z-19"),
                ("Narragansett Avenue (40 Steps)", "Z-2"),
                ("Pine Street", "Z-9"),
                ("Poplar Street", "Z-14"),
                ("Ruggles Avenue", "Z-4"),
                ("Seaview Avenue", "Z-5"),
                ("Sisson's Wharf", "Z-21"),
                ("Spring Wharf", "Z-23"),
                ("Van Zandt Avenue", "Z-7"),
                ("Waites Wharf", "Z-22"),
                ("Walnut Street", "Z-12"),
                ("Webster Street", "Z-1"),
                ("Willow Street", "Z-13")
            ]
        case .northKingstown:
            return [
                ("Loop Drive", "F-6"),
                ("Loop Drive (2)", "F-7"),
                ("Phillips Street", "F-5")
            ]
        case .pawtucket:
            return [
                ("Bishop Street", "M-1")
            ]
        case .portsmouth:
            return [
                ("Anthony Road", "V-2"),
                ("Aquidneck Avenue", "V-13"),
                ("Atlantic Avenue (easterly end of Tallman Ave)", "V-15"),
                ("Atlantic Avenue (easterly end of East Corey's land)", "V-1"),
                ("Cedar Avenue", "V-4"),
                ("Child Street", "V-16"),
                ("Fountain Street", "V-12"),
                ("Green Street", "V-6"),
                ("Morningside Lane", "V-17"),
                ("Mountview Road", "V-1"),
                ("Narragansett Road", "V-3"),
                ("Point Street", "V-5"),
                ("Ruth Avenue", "V-11"),
                ("Seaconnet Blvd", "V-8"),
                ("Seaconnet Blvd (n'east corner of Don Ibbotson's land)", "V-9"),
                ("Seaconnet Blvd (n'east corner of Virginia Arruda's land)", "V-10"),
                ("Seaconnet Blvd (n'east corner of Wm. Herbert's land)", "V-7")
            ]
        case .providence:
            return [
                ("Butler Avenue", "L-2"),
                ("East Transit Street", "L-3"),
                ("Irving Avenue", "L-1")
            ]
        case .southKingstown:
            return [
                ("Dawn Drive", "D-2"),
                ("Daybreak Drive", "D-3"),
                ("Ocean Avenue", "D-4"),
                ("Statice Drive", "D-1")
            ]
        case .tiverton:
            return [
                ("Carey Lane", "T-1"),
                ("Fogland Road", "T-4"),
                ("Land south of Sakonnet Bridge", "T-5"),
                ("Nannaquaket Bridge", "T-3"),
                ("South of Stone Bridge", "T-7"),
                ("State Avenue", "T-2"),
                ("Two Rod Way", "T-6")
            ]
        case .warren:
            return [
                ("Harris Avenue", "R-4"),
                ("Maple Street", "R-1"),
                ("Parker Avenue", "R-2"),
                ("Patterson Avenue", "R-3"),
                ("Road to Town Landing", "R-10"),
                ("Shore Drive (3)", "R-6"),
                ("Shore Drive (5)", "R-7"),
                ("Shore Drive (6)", "R-8"),
                ("Shore Drive (7)", "R-9")
            ]
        case .warwick:
            return [
                ("Alger Avenue & John Wickes Avenue", "J-39"),
                ("Beachwood Drive (east side) #1", "J-7"),
                ("Beachwood Drive (east side) #2", "J-8"),
                ("Bradford Avenue", "J-1"),
                ("Bradford Avenue", "J-40"),
                ("Burnett Road (east side) #1", "J-16"),
                ("Ogden Avenue off Burnett Road", "J-38"),
                ("Burnett Road (east side) #2", "J-17"),
                ("Burnett Road (east side) #3", "J-18"),
                ("Butler Court", "J-23"),
                ("Charlotte Drive #4", "J-6"),
                ("Charlotte Drive (north side) #1", "J-3"),
                ("Charlotte Drive (north side) #2", "J-4"),
                ("Charlotte Drive (north side) #3", "J-5"),
                ("Cooney Street", "J-14"),
                ("Off Cooney Street/Extension of Lilac Street", "J-33"),
                ("Elkins Avenue", "J-2"),
                ("Gaspee Point Drive", "J-22"),
                ("Ives Road", "J-25"),
                ("Masthead Drive", "J-37"),
                ("Narragansett Bay Avenue", "J-28"),
                ("Nausauket Road", "J-24"),
                ("Off Shawomet Avenue", "J-29"),
                ("Off Ship Street (Ship Court)", "J-30"),
                ("Peck Lane - Pawtuxet Village", "J-32"),
                ("Priscilla Avenue", "J-36"),
                ("Progress Street", "J-15"),
                ("Reynolds Avenue", "J-11"),
                ("Off Reynolds Avenue", "J-35"),
                ("Rock Avenue/Bromle Avenue", "J-34"),
                ("Shawomet Avenue (north side)", "J-19"),
                ("Shawomet Avenue (south side)", "J-20"),
                ("Sheffield Street", "J-10"),
                ("Suburban Parkway", "J-31"),
                ("Sylvia Drive", "J-9"),
                ("Tiffany Avenue/Progress Street", "J-26"),
                ("Waterfront Drive", "J-13")
            ]
        case .westerly:
            return [
                ("Atlantic Avenue #1", "A-6"),
                ("Atlantic Avenue #2", "A-7"),
                ("Atlantic Avenue #4", "A-8"),
                ("Atlantic Avenue #5", "A-9"),
                ("Atlantic Avenue #6", "A-10"),
                ("Atlantic Avenue #7", "A-11"),
                ("Atlantic Avenue #8", "A-12"),
                ("Atlantic Avenue #9", "A-13"),
                ("Avondale Road", "A-14"),
                ("Bluff Avenue", "A-2"),
                ("Manatuck Avenue", "A-3")
            ]
        }
    }
    
    /* Convenience ViewModel-esque cheat for CaseIterable Municipality enum */
    static func accessPointsForMunicipalityIndex(_ index: Int) -> [(String, String)] {
        let municipality = Municipality.allCases[index]
        return self.accessPointsForMunicipality(municipality)
    }
}

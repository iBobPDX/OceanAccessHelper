//
//  People.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/18/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import Foundation

enum PeopleObservation {
    case none
    case walkers(Int) /* Int is meant to encode the count of each type, we might rething this */
    case fishermen(Int)
    case surfers(Int)
    case other(Int)
}

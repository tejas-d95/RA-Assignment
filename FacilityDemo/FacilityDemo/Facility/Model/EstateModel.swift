//
//  DataModel.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 28/06/23.
//

import Foundation

struct EstateModel: Codable {
    let facilities: [Facility]
    let exclusions: [[Exclusion]]
}

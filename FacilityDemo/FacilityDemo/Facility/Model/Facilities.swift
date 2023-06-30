//
//  Facility.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 28/06/23.
//
import Foundation

struct Facility: Codable {
    let facility_id: String
    let name: String
    let options: [Option]
    var selectedOption: Option?  // Property to track the selected option
}






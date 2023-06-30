//
//  Option.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 28/06/23.
//

import Foundation

struct Option: Codable, Equatable {
    let name: String
    let icon: String
    let id: String
    
    static func ==(lhs: Option, rhs: Option) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        return false
    }
}

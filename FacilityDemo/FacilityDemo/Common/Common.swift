//
//  Constant.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 28/06/23.
//

import Foundation
import UIKit

struct Constant {
    static let facilityTableViewCellIdentifier = "FacilityTableViewCell"
}

struct ApiEndpoints
{
    static let facility = "https://my-json-server.typicode.com/iranjith4/ad-assignment/db"
}
struct ErrorMessage {
    static let invalidURL = "Invalid URL"
    static let exclusionFoundError = "This combination is not allowed, please select different option!"
}

struct ErrorTitle {
    static let genericTitle = "Error"
    static let exclusionFoundTitle = "Opps"
}

struct AppImages {
    static let checkedBoxImage = UIImage(named: "check_box_48")
    static let uncheckedBoxImage = UIImage(named: "uncheck_box_48")
}


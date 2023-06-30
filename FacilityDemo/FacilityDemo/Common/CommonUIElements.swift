//
//  CommonUIElements.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 29/06/23.
//

import Foundation
import UIKit

func showErrorAlert<T>(title: String, message: T, viewController: UIViewController) {
    let errorMessage = String(describing: message)
    
    let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    
    DispatchQueue.main.async {
        viewController.present(alertController, animated: true, completion: nil)
    }
}
func showErrorAlert<T>(title: String, message: T, viewController: UIViewController, okClicked: @escaping (Bool) -> Void) {
    let errorMessage = String(describing: message)
    
    let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        okClicked(true)
    }
    alertController.addAction(okAction)
    
    DispatchQueue.main.async {
        viewController.present(alertController, animated: true, completion: nil)
    }
}


func headerViewForTable(with frame: CGRect, section: Int, title: String) -> UIView? {
    let headerView = UIView()
    headerView.tag = section
    
    let bgColor = UIColor(red: 58/255, green: 96/255, blue: 228/255, alpha: 1.0)

    headerView.backgroundColor = bgColor
    

    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold) // Set the desired font size
    label.textColor = .white
    label.text = title
    label.translatesAutoresizingMaskIntoConstraints = false
    
    // Add the label to the header view
    headerView.addSubview(label)
    
    // Set up constraints for the label
    NSLayoutConstraint.activate([
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
    ])
    
    // Apply border and shadow to the header view
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        headerView.layer.shadowOpacity = 0.5
        headerView.layer.shadowRadius = 4.0
        headerView.layer.masksToBounds = false

    return headerView
}
